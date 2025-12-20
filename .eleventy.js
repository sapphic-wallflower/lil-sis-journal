export default function(eleventyConfig) {
    eleventyConfig.setInputDirectory("src")
    eleventyConfig.addPassthroughCopy({ "src/assets": "assets" })
    eleventyConfig.addPassthroughCopy("CNAME")
    eleventyConfig.setDataFileSuffixes([ ".data" ])
}