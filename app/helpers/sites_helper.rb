module SitesHelper

  def site_humanize_column(column = '')
    Site.human_attribute_name(column)
  end

  def widget_js
    "#{APP_CONFIG['HOST']}/assets/widget.js"
  end

  def widget_code(site = nil)
    return unless site
    javascript_tag do
      "_chcfg = {widget_id: \"#{site.uuid}\", user_prefix: \"#{site.user_prefix}\"};
(function() { var chs = document.createElement(\"script\");
chs.type = \"text/javascript\"; chs.async = true;
chs.src = (\"https:\" == document.location.protocol ? \"https\" : \"http\")+\"://#{widget_js}\";
var s = document.getElementsByTagName(\"script\")[0];
s.parentNode.insertBefore(chs, s.nextSibling); })();"
    end

  end

end
