(function(document){

window.MBP = window.MBP || {}; 

MBP.viewportmeta = document.querySelector && document.querySelector('meta[name="viewport"]');
MBP.ua = navigator.userAgent;

MBP.scaleFix = function () {
  if (MBP.viewportmeta && /iPhone|iPad/.test(MBP.ua) && !/Opera Mini/.test(MBP.ua)) {
    MBP.viewportmeta.content = "width=device-width, minimum-scale=1.0, maximum-scale=1.0";
    document.addEventListener("gesturestart", MBP.gestureStart, false);
  }
};

MBP.gestureStart = function () {
  MBP.viewportmeta.content = "width=device-width, minimum-scale=0.25, maximum-scale=1.6";
};

MBP.hideAddressBar = function(){
  if (navigator.userAgent.match(/Android/i)) {
    window.scrollTo(0,0); // reset in case prev not scrolled
    var nPageH = $(document).height();
    var nViewH = window.outerHeight;
    if (nViewH > nPageH ) {
      nViewH = nViewH / window.devicePixelRatio;
      $('body').css('height',nViewH + 'px');
    }
    window.scrollTo(0,1);
  }else if(navigator.userAgent.match(/iPhone|iPod/i)) {
    setTimeout(hideURLbar, 0);
    addEventListener("load", function() {
      setTimeout(hideURLbar, 0);
      setTimeout(hideURLbar, 500);
    }, false);
  }
  function hideURLbar(){
    if(!pageYOffset){
      window.scrollTo(0,0);
    }
  }
  return this;
}

})(document);