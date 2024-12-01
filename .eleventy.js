const sass = require("sass");
const syntaxHighlight = require("@11ty/eleventy-plugin-syntaxhighlight");
const { DateTime } = require("luxon");
const pluginRss = require("@11ty/eleventy-plugin-rss");
const markdownIt = require("markdown-it");
const markdownItAnchor = require("markdown-it-anchor");
const pluginNavigation = require("@11ty/eleventy-navigation");
const pluginTOC = require('eleventy-plugin-toc')

module.exports = function (eleventyConfig) {
    eleventyConfig.addPassthroughCopy("src/cdn");
    eleventyConfig.addPassthroughCopy("src/assets/fonts");
    eleventyConfig.addPassthroughCopy("src/assets/js");
    eleventyConfig.addPassthroughCopy("src/assets/img");
    eleventyConfig.addTemplateFormats("scss");

    eleventyConfig.setBrowserSyncConfig({
        files: "assets/style/*.css",
    });

    eleventyConfig.addPlugin(pluginRss);
    eleventyConfig.addPlugin(syntaxHighlight);
    eleventyConfig.addPlugin(pluginNavigation);
    eleventyConfig.addPlugin(pluginTOC, {
        tags: ['h2', 'h3'],
        ul: true,
        listClass: 'toc-list',
        listItemClass: 'toc-list-item',
        linkClass: 'toc-link',
        wrapper: 'div',
        wrapperClass: 'toc',
        slugify: function (str) {
            return str.toLowerCase().replace(/[^\w ]+/g, '').replace(/ +/g, '-');
        }
    });
    eleventyConfig.addFilter("readableDate", (dateObj) => {
        return DateTime.fromJSDate(dateObj, { zone: "utc" }).toFormat(
            "dd LLL yyyy"
        );
    });

    // https://html.spec.whatwg.org/multipage/common-microsyntaxes.html#valid-date-string
    eleventyConfig.addFilter("htmlDateString", (dateObj) => {
        return DateTime.fromJSDate(dateObj, { zone: "utc" }).toFormat("yyyy-LL-dd");
    });

    // Get the first `n` elements of a collection.
    eleventyConfig.addFilter("head", (array, n) => {
        if (!Array.isArray(array) || array.length === 0) {
            return [];
        }
        if (n < 0) {
            return array.slice(n);
        }

        return array.slice(0, n);
    });

    // Return the smallest number argument
    eleventyConfig.addFilter("min", (...numbers) => {
        return Math.min.apply(null, numbers);
    });

    function filterTagList(tags) {
        return (tags || []).filter(
            (tag) => ["nav", "post", "posts", "blog"].indexOf(tag) === -1
        );
    }

    eleventyConfig.addFilter("filterTagList", filterTagList);

    // Create an array of all tags
    eleventyConfig.addCollection("tagList", function (collection) {
        let tagSet = new Set();
        collection.getAll().forEach((item) => {
            (item.data.tags || []).forEach((tag) => tagSet.add(tag));
        });

        return filterTagList([...tagSet]);
    });

    // Customize Markdown library and settings:
    let markdownLibrary = markdownIt({
        html: true,
        linkify: true,
    }).use(markdownItAnchor, {
        permalink: markdownItAnchor.permalink.ariaHidden({
            placement: "after",
            class: "direct-link",
            symbol: "#",
            wrapper: 'div'
        }),
        level: [1, 2, 3, 4],
        slugify: eleventyConfig.getFilter("slugify"),
    });
    eleventyConfig.setLibrary("md", markdownLibrary);

    eleventyConfig.addExtension("scss", {
        outputFileExtension: "css",
        compile: async function (inputContent) {
            let result = sass.compileString(inputContent);
            return async (data) => {
                return result.css;
            };
        },
    });

    return {
        templateFormats: ["md", "njk", "html", "liquid"],
        markdownTemplateEngine: "njk",
        htmlTemplateEngine: "njk",
        pathPrefix: "/",
        dir: {
            input: "src",
            includes: "_includes",
            data: "_data",
            output: "_site"
        },
    };
};