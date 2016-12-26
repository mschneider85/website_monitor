class UrlRepository < Hanami::Repository
  def find_by(arg, *args)
    urls.where(arg, *args).limit(1).first
  rescue Sequel::DatabaseError
    nil
  end

  def for_token(token)
    urls
      .where(token: token)
      .to_a
  end
end
