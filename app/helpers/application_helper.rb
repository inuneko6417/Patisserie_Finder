module ApplicationHelper
  def flash_background_color(type)
    case type.to_sym
    when :notice then "bg-green-500"
    when :alert  then "bg-red-500"
    when :error  then "bg-yellow-500"
    else "bg-gray-500"
    end
  end

  def default_meta_tags
    {
      site: "patisserie_finder",
      title: "パティスリーを共有できるサービス",
      reverse: true,
      charset: "utf-8",
      description: "パティスリーを共有できるサービスです。自分の好きなパティスリーを登録して、他の人と共有しましょう。",
      keywords: "ケーキ,パティスリー,地元,共有",
      canonical: "https://patisserie-finder.onrender.com",
      separator: "|",
      og: {
        site_name: "patisserie_finder",
        title: "パティスリーを共有できるサービス",
        description: "パティスリーを共有できるサービスです。自分の好きなパティスリーを登録して、他の人と共有しましょう。",
        type: "website",
        url: "https://patisserie-finder.onrender.com",
        image: "https://patisserie-finder.onrender.com/ogp.png",
        locale: "ja_JP"
      },
      twitter: {
        card: "summary_large_image",
        site: "@obvyamdrss",
        image: "https://patisserie-finder.onrender.com/ogp.png"
      }
    }
  end
end
