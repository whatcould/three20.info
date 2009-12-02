
google.load("feeds", "1");

function initialize() {
  var feed = new google.feeds.Feed("/blog/?feed=rss2");
  $('#loading').css('display', 'block');
  feed.load(function(result) {
    $('#loading').css('display', 'none');
    if (!result.error) {
      for (var i = 0; i < 5 && i < result.feed.entries.length; i++) {
        var entry = result.feed.entries[i];

        var title = $('<h2>')
          .addClass('title')
          .append(entry.title);

        var message = $('<p>')
          .addClass('message')
          .append(entry.contentSnippet);

        var commit_message = $('<div>')
          .addClass('source')
          .append($('<span>').append('posted: '))
          .append($('<a>')
            .attr('href', entry.link)
            .append(entry.publishedDate));

        var infoBox = $('<div>')
          .addClass('infobox')
          .append(commit_message)
          .append(message);

        var commit = $('<div>').addClass('post')
          .append(title)
          .append(infoBox);
        $('#news').append(commit);
      }
    } else {  
      $('#news').append($('<p>')
        .append('Darn, there was a problem loading the blog feed. ')
        .append($('<a>')
          .attr('href', '/blog/')
          .append('Head over to the blog'))
        .append('.'));
    }
  });
}
google.setOnLoadCallback(initialize);
