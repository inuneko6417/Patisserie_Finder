module ApplicationHelper
  def default_meta_tags
    {
      site: "patisserie_finder",
      title: "パティスリーを共有できるサービス",
      reverse: true,
      charset: "utf-8",
      description: "パティスリーを共有できるサービスです。自分の好きなパティスリーを登録して、他の人と共有しましょう。",
      keywords: "ケーキ,パティスリー,地元,共有",
      canonical: "https://patisserie-finder-1.onrender.com",
      separator: "|",
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: "website",
        url: "https://patisserie-finder-1.onrender.com",
        image: image_url("ogp.png"),
        local: "ja-JP"
      },
      twitter: {
        card: "summary_large_image",
        site: "@obvyamdrss",
        image: image_url("ogp.png")
      }
    }
  end
end
