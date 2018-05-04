// https://product.voxmedia.com/til/2016/1/22/10814518/css-injection-with-browsersync-gulp-and-the-rails-asset-pipeline
// https://gist.github.com/wnstn/36010c8378e850cc3580

const path = require('path')
const fs = require('fs');

const gulp = require('gulp');
const plumber = require('gulp-plumber');
const watch = require('gulp-watch');

const autoprefixer = require('autoprefixer')
const babelify = require('babelify')
const browserify = require('browserify')
const browsersync = require('browser-sync').create()
const buffer = require('vinyl-buffer')
const notifier = require('node-notifier')
const postcss = require('gulp-postcss')
const rename = require('gulp-rename');
const rimraf = require('rimraf')
const sass = require('gulp-sass')
const source = require('vinyl-source-stream')
const sourcemaps = require('gulp-sourcemaps')
const uglify = require('gulp-uglify')
const util = require('gulp-util')


const symlinked = require("symlinked")

let symlinkedPaths = symlinked.paths();
let modifiedSymlinkedPaths;

let watchedJSPaths = [`frontend/assets/js/main.js`];

if (symlinkedPaths.length) {
    modifiedSymlinkedPaths = symlinkedPaths.map((item) => {
        return item + '/dist/**/*';
    })

    watchedJSPaths = watchedJSPaths.concat(modifiedSymlinkedPaths);
}

function showError(arg) {
    notifier.notify({
        title: 'Error',
        message: '' + arg,
        sound: 'Basso'
    })
    console.log(arg)
}


gulp.task('clean', (cb) => {
    rimraf('public/assets', cb)
})

gulp.task('build', ['clean'], () => {
    gulp.start('svg', 'images', 'js', 'css')
})

gulp.task('images', () => {
    return gulp.src('frontend/assets/images/**/*.{png, jpg, gif}')
        .pipe(gulp.dest('public/assets/images'))
})

gulp.task('svg', () => {
    return gulp.src('frontend/assets/svg/**/*.svg')
        .pipe(gulp.dest('public/assets/svg'))
})


gulp.task('css', () => {
    return gulp.src(path.join('frontend/assets/css/main.scss'))
        .pipe(plumber({
            errorHandler: function (err) {
                console.log(err);
            }
        }))
        .pipe(sourcemaps.init())
        .pipe(sass({
            outputStyle: 'nested',
            precision: 10,
            includePaths: ['.', 'node_modules'],
            onError: showError
        }).on('error', function(error) {
            showError(error)
        }))
        .pipe(postcss([
            autoprefixer({
                browsers: ['last 2 versions', 'Firefox ESR', 'Explorer >= 9', 'Android >= 4.0', '> 2%']
            })
        ]))
        .pipe(sourcemaps.write())
        .pipe(gulp.dest('public/assets/css'))
        .pipe(browsersync.stream({match: '**/*.css'}))
})



gulp.task('js', () => {


    return browserify({
            entries: path.join('frontend/assets/js', `main.js`), 
            debug: false
        })
        .transform("babelify", {
            presets: ['env']
        })
        .bundle()
            .on('error', showError)
        .pipe(source(`main.js`))
        .pipe(buffer())
        .pipe(gulp.dest('public/assets/js'))
        .pipe(rename(`main.min.js`))
        .pipe(sourcemaps.init({
            loadMaps: true
        }))
        .pipe(uglify())
            .on('error', showError)
        .pipe(sourcemaps.write('./'))
        .pipe(gulp.dest('public/assets/js'))
        .pipe(browsersync.stream({match: path.join('**','*.js')}))
})

let setupWatchers = () => {
    gulp.watch('app/views/**/*', ['reload'])
    gulp.watch('frontend/assets/svg/**/*.svg', ['svg'])
    gulp.watch('frontend/assets/images/**/*.{png, jpg, gif}', ['images'])
    gulp.watch(watchedJSPaths, ['js', 'reload'])
    gulp.watch('frontend/assets/css/**/*.scss', ['css', 'reloadCSS'])
}

gulp.task('reload', function() {
    return browsersync.reload();
})

gulp.task('reloadCSS', function() {
    return browsersync.reload('*.css');
})

gulp.task('watch', ['build'], () => {
    browsersync.init({
        proxy: 'localhost:3000',
        port: 3001,
        open: false,
        ui: {
            port: 3002
        },
        snippetOptions: {
            rule: {
                match: /<\/head>/i,
                fn: function (snippet, match) {
                    return snippet + match;
                }
            }
        },
    })

    setupWatchers();
})


gulp.task('default', ['watch']);