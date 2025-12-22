import moment from "moment"
export default function(eleventyConfig) {
    eleventyConfig.setInputDirectory("src")
    eleventyConfig.addPassthroughCopy({ "src/assets": "assets" })
    eleventyConfig.addPassthroughCopy("CNAME")
    eleventyConfig.setDataFileSuffixes([ ".data" ])

    // Filters
	eleventyConfig.addFilter("prettyDateTime", date => moment.utc(date).format("DD MMMM YYYY @ h:mm:ss A z"))
	eleventyConfig.addFilter("prettyDate", date => moment.utc(date).format("DD MMMM YYYY"))
	eleventyConfig.addFilter("prettyTime", date => moment.utc(date).format("h:mm:ss A"))
	eleventyConfig.addFilter("isoDate", date => date.toISOString())

}