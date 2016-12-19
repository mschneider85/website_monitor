class UrlRepository < Hanami::Repository
  def find_by_address(string)
    urls
      .where(address: string)
      .limit(1)
      .first
  end
end
