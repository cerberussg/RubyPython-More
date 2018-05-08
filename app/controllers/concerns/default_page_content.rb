module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Scott Goyette | my Portfolio"
    @seo_keywords = "Scott Goyette portfolio"
  end
end
