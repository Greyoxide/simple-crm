module TableHelper

  require 'nokogiri'
  def table(options = {}, &block)
    contents = capture(&block)
    parsed_contents = Nokogiri::HTML::DocumentFragment.parse(contents)
    rows = parsed_contents.css('.row')

    return if rows.blank?
    content_tag :div, class: "table #{ options.fetch(:class, '') }" do
      concat construct_header(rows.first)
      concat contents
    end
  end


  def row(options = {}, &block)
    content_tag :div, class: "row #{options.fetch(:class, '')}", id: options.fetch(:id, '') do
      concat capture(&block)
    end
  end

  def field(options = {}, &block)
    if block_given?
      content_tag :div, class: "field #{options.fetch(:class, '')}", id: options.fetch(:id, ''), data: { label: options.fetch(:label) } do
        concat capture(&block)
      end
    else
      content_tag :span,
                  options.fetch(:body),
                  class: "field #{options.fetch(:class, '')}",
                  data: { label: options.fetch(:label)}
    end
  end

  def construct_header(row)
    fields = row.css('.field')
    content_tag :div, class: 'header row' do
      fields.each do |f|
        concat content_tag :span, f['data-label'].titleize
      end
    end
  end

end