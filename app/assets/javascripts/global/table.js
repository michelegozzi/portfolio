$.fn.rowLinkTo=function(options)
{
  var defaults = {
    restPath:'',
    idSelector:'input[type=hidden]'
  };

  options=$.extend({}, defaults, options);

  if(options.restPath !== undefined || options.restPath.length > 0) {
    this.children('tr').each(function() {
      $(this).click(function() {
        document.location=options.restPath+$(this).find(options.idSelector).val();
      });
    });
  }
  else {
    console.error("Failure in rowLinkTo: options.restPath is empty or undefined.");
  }
};

$.fn.rowLinkTo2=function(options)
{
  var defaults = {
    restPath:'',
    selectors: [{ tag: 'id', selector: 'input[name=id][type=hidden]' }]
  };

  options=$.extend({}, defaults, options);

  if(options.restPath !== undefined || options.restPath.length > 0) {
    this.children('tr').each(function() {
      $(this).children('td[class*=clickable]').each(function() {
        $(this).click(function() {
          var cell = $(this);
          var url = options.restPath;
          options.selectors.forEach(function (item) {
            var tag = item.tag;
            /*console.log('tag:' + tag);*/
            var selector = item.selector;
            /*console.log('selector:' + selector);*/
            var value = cell.siblings(selector).val();
            /*console.log('value:' + value);*/
            var pattern = new RegExp("\:"+tag);
            url = url.replace(pattern, value);
          });
          /*console.log(url);*/
          document.location=url;
        }).css('cursor', 'pointer');
      });
    });
  }
  else {
    console.error("Failure in rowLinkTo: options.restPath is empty or undefined.");
  }
};