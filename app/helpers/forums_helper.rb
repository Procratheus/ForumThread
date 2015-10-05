module ForumsHelper
  def markdownify(content)
    pipeline = HTML::Pipeline.new [
      HTML::Pipeline::SanitizationFilter,
      HTML::Pipeline::MarkdownFilter,
    ]
    pipeline.call(content)[:output].to_s
  end
end
