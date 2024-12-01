const elasticlunr = require("elasticlunr");

module.exports = function (collection) {
    var index = elasticlunr(function () {
        this.addField("title");
        this.addField("tags");
        this.setRef("id");
    });

    collection.forEach((page) => {
        index.addDoc({
            id: page.url,
            title: page.template.frontMatter.data.title,
            tags: page.template.frontMatter.data.tags,
        });
    });

    return index.toJSON();
};
