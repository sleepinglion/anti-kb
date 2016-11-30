window['CKEDITOR_BASEPATH'] = "/assets/ckeditor/";

window.CKEDITOR_ASSETS_MAPPING = {
<% Rails.application.assets.each_logical_path(->(path){ path =~ /ckeditor/ && path != 'ckeditor/override.js' }) do |asset| %>
  "<%= asset %>": "<%= asset_path(asset) %>",
<% end %>
}

window.CKEDITOR_GETURL = function( resource ) {
  // If this is not a full or absolute path.
  if ( resource.indexOf( ':/' ) == -1 && resource.indexOf( '/' ) !== 0 )
    resource = this.basePath + resource;

  // Add the timestamp, except for directories.
  if ( resource.charAt( resource.length - 1 ) != '/'  ){
    var url = resource.match( /^(.*?:\/\/[^\/]*)\/assets\/(.+)/ );
    if(url) resource = url[1] + (CKEDITOR_ASSETS_MAPPING[url[2]] || '/assets/' + url[2]);
  }

  return resource;
}
