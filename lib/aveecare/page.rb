# frozen_string_literal: true

module Aveecare
  # One page of a list response.
  #
  # +data+ holds the current page. Because Page is Enumerable, iterating it walks
  # every item on this page and every following page, fetching more as needed
  # (lazily: +first(5)+ stops after the page that holds the fifth item):
  #
  #   client.patients.list(limit: 100).each { |patient| puts patient.id }
  #   client.patients.list.lazy.select(&:active).first(10)
  #
  # To go page by page, use #has_next_page? and #next_page, or #each_page.
  class Page
    include Enumerable

    # @return [Array] the objects on this page
    attr_reader :data
    # @return [String, nil] cursor of the following page; nil on the last page
    attr_reader :next_cursor
    # @return [Boolean] whether another page exists
    attr_reader :has_more

    # @api private
    def initialize(data:, next_cursor:, has_more:, fetcher:)
      @data = data
      @next_cursor = next_cursor
      @has_more = has_more && !next_cursor.nil?
      @fetcher = fetcher
    end

    # @return [String] always "list"
    def object
      "list"
    end

    def has_next_page?
      @has_more
    end

    # Fetch the following page with the same filters. Check #has_next_page? first.
    #
    # @raise [Aveecare::Error] when there is no next page
    # @return [Aveecare::Page]
    def next_page
      raise Error, "No more pages. Check has_next_page? before calling next_page." unless has_next_page?

      @fetcher.call(@next_cursor)
    end

    # Yields this page and every following page.
    def each_page
      return enum_for(:each_page) unless block_given?

      page = self
      loop do
        yield page
        break unless page.has_next_page?

        page = page.next_page
      end
      self
    end

    # Yields every item on this page and every following page.
    def each(&block)
      return enum_for(:each) unless block

      each_page { |page| page.data.each(&block) }
      self
    end
    alias auto_paging_each each

    def inspect
      "#<#{self.class.name} data=<#{data.length} items> has_more=#{has_more} next_cursor=#{next_cursor.inspect}>"
    end
  end
end
