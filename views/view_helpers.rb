module ViewHelpers
  
  def cc_html(options={}, &blk)
    attrs = options.map { |(k, v)| " #{h k}='#{h v}'" }.join('')
    [ "<!--[if IEMobile 7]><html #{attrs} class='no-js iem7'><![endif]-->",
      "<!--[if (gt IEMobile 7)|!(IEMobile)]><!--><html #{attrs} class='no-js' lang='en'><!--<![endif]-->",
      "<!--[if lt IE 7]><html #{attrs} class='no-js lt-ie9 lt-ie8 lt-ie7' lang='en'> <![endif]-->",
      "<!--[if (IE 7)&!(IEMobile)]><html #{attrs} class='no-js lt-ie9 lt-ie8' lang='en'><![endif]-->",
      "<!--[if (IE 8)&!(IEMobile)]><html #{attrs} class='no-js lt-ie9' lang='en'><![endif]-->",
      "<!--[if gt IE 8]><!--> <html #{attrs} class='no-js' lang='en'><!--<![endif]-->",
      capture_haml(&blk).strip,
      "</html>"
    ].join("\n")
  end
  
  def meta_tags
    [
      tag("meta", :charset => "utf-8"),
      tag("meta", :name => "description", :content => "A responsive template"),
      tag("meta", :name => "author", :content => "c to the izzo"),
      tag("meta", "http-equiv" => "Content-Language", "content" => "en"),
      tag("meta", :name => "HandhellFiedly", :content => "True"),
      tag("meta", :name => "MobileOptimized", :content => "320"),
      tag("meta", :name => "viewport", :content => "width=device-width, initial-scale=1.0"),
      tag("meta", "http-equiv" => "cleartype", "content" => "on"),
      ### Uncomment the code when moved to a rails app (serve doesn't know what these favicon helpers are)
      ## For iPhone 4
      #favicon_link_tag( 'responsive_icon114.png', :rel => 'apple-touch-icon-precomposed', :sizes => '114x114'),
      ## For iPad 1/2
      #favicon_link_tag( 'responsive_icon72.png', :rel => 'apple-touch-icon-precomposed', :sizes => '72x72'),
      ## For iPhone 3G, 3GS, android, and iPod Touch
      #favicon_link_tag( 'responsive_icon.png', :rel => 'apple-touch-icon-precomposed'),
      ## For the new iPad
      #favicon_link_tag( 'responsive_icon144.png', :rel => 'apple-touch-icon-precomposed', :sizes => '144x144'),
      ## For Nokia
      #favicon_link_tag( 'responsive.png', :rel => 'shortcut icon'),
      ## For everything else
      #favicon_link_tag( 'favicon.ico', :rel => 'shortcut icon'),
      tag('meta', :name => 'apple-mobile-web-app-capable', :content => 'yes')
  ].join("\n").html_safe
  end
  
  def jquery_include_tag(version)
    local = escape_javascript(javascript_include_tag("/javascripts/jquery-#{version}.min.js"))
    [ javascript_include_tag("//ajax.googleapis.com/ajax/libs/jquery/#{version}/jquery.min.js"),
      javascript_tag("window.jQuery || document.write('#{local}');")
    ].join("\n").html_safe
  end
  
  def microsoft_fix_for_mobile
    javascript_tag do
      javascript = <<-JAVASCRIPT
        (function(a,b,c){if(c in b&&b[c]){var d,e=a.location,f=/^(a|html)$/i;a.addEventListener("click",function(a){d=a.target;while(!f.test(d.nodeName))d=d.parentNode;"href"in d&&(d.href.indexOf("http")||~d.href.indexOf(e.host))&&(a.preventDefault(),e.href=d.href)},!1)}})(document,window.navigator,"standalone")
      JAVASCRIPT
      javascript.html_safe
    end
  end
  
  def modernizr
    javascript_tag do
      javascript = <<-JAVASCRIPT
        Modernizr.load({
          test : Modernizr.mq('(min-width: 0px)'),
          nope : ['/javascripts/respond.min.js']
        });
      JAVASCRIPT
      javascript.html_safe
    end
  end
  
  def google_analytics
    javascript_tag do
      javascript = <<-JAVASCRIPT
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-28311055-1']);
        _gaq.push(['_trackPageview']);

        (function() {
          var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
          ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
          var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
      JAVASCRIPT
      javascript.html_safe
    end
  end
  
  # RUBY that doesn't need to be copied over to the rails project
  JS_ESCAPE_MAP	=	{ '\\' => '\\\\', '</' => '<\/', "\r\n" => '\n', "\n" => '\n', "\r" => '\n', '"' => '\\"', "'" => "\\'" }
  def escape_javascript(javascript)
    if javascript
      result = javascript.gsub(/(\\|<\/|\r\n|\342\200\250|[\n\r"'])/u) {|match| JS_ESCAPE_MAP[match] }
      javascript.html_safe? ? result.html_safe : result
    else
      ''
    end
  end

end