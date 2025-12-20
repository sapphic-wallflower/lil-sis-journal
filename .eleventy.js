export default function(eleventyConfig) {
    eleventyConfig.setInputDirectory("src")
    eleventyConfig.addPassthroughCopy({ "src/assets": "assets" })
    eleventyConfig.setDataFileSuffixes([ ".data" ])
}