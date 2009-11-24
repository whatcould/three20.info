/**
 * The home page js for github commits.
 */

$(document).ready(function() {

  var repo = new GitHub.Repo('facebook', 'three20');

  repo.commits('master', function(commits) {
    $('#github .loading').css('display', 'none');
    for( var i = 0; i < 5 && i < commits.length; ++i ) {
      var author = $('<a>')
        .attr('href', commits[i].url)
        .addClass('author')
        .append(commits[i].author.name);

      var message = $('<pre>')
        .addClass('message')
        .append(commits[i].message);

      var commit_message = $('<div>')
        .addClass('date')
        .append($('<span>').append('committed: '))
        .append(commits[i].committed_date);

      var infoBox = $('<div>')
        .addClass('infobox')
        .append(commit_message)
        .append(message);

      var commit = $('<div>').addClass('commit')
        .append(author)
        .append(infoBox);
      $('#github .content .commits').append(commit);
    }
  });
});

google.load("feeds", "1");

function initialize() {
  var feed = new google.feeds.Feed("http://groups.google.com/group/three20/feed/rss_v2_0_msgs.xml");
  feed.load(function(result) {
    if (!result.error) {
      $('#newsgroup .loading').css('display', 'none');
      for (var i = 0; i < 5 && i < result.feed.entries.length; i++) {
        var entry = result.feed.entries[i];

        var title = $('<a>')
          .attr('href', entry.link)
          .addClass('title')
          .append(entry.title);

        var message = $('<div>')
          .addClass('message')
          .append(entry.contentSnippet);

        var commit_message = $('<div>')
          .addClass('date')
          .append($('<span>').append('posted: '))
          .append(entry.publishedDate);

        var infoBox = $('<div>')
          .addClass('infobox')
          .append(commit_message)
          .append(message);

        var commit = $('<div>').addClass('post')
          .append(title)
          .append(infoBox);
        $('#newsgroup .content .posts').append(commit);
      }
    }
  });
}
google.setOnLoadCallback(initialize);
