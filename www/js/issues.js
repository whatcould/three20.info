/**
 * The home page js for github commits.
 */

$(document).ready(function() {

  var repo = new GitHub.Repo('facebook', 'three20');

  repo.issues('open', function(issues) {
    var kUnlabeled = 'unlabeled';
    var kLabelOrderSeverity = [
      'fixavailable',
      'crash',
      'appstore',
      'bug',
      'leak',
      'minor',
      'featurerequest',
      'norepro',
    ];

    var label_buckets = {};
    for( var i in issues ) {
      var issue = issues[i];
      for( var j in issue.labels ) {
        var label = issue.labels[j];
        if( !(label in label_buckets) ) {
          label_buckets[label] = [];
        }
        label_buckets[label].push(issue);
      }

      if( !issue.labels.length ) {
        if( !(kUnlabeled in label_buckets) ) {
          label_buckets[kUnlabeled] = [];
        }
        label_buckets[kUnlabeled].push(issue);
      }
    }

    var converter = new Showdown.converter();

    var toc = $('<ul>');

    for( var i in kLabelOrderSeverity ) {
      var label = kLabelOrderSeverity[i];

      if( !(label in label_buckets) ) {
        continue;
      }

      var issues = label_buckets[label];

      issues.sort(function(a,b) {return b.number - a.number});

      toc.append($('<li>')
        .append($('<a>').attr('href', '#'+label).text(label)));

      var section = $('<div>')
        .append($('<h1>').attr('id', label).text(label));

      for( var j in issues ) {
        var issue = issues[j];

        var description = $('<div>').addClass('description');

        description.text(formattedBody);
        var formattedBody = converter.makeHtml(issue.body);

        var item = $('<div>')
          .append($('<h2>').text(issue.title))
          .append($('<div>')
            .addClass('source')
            .append('Source: <a href="http://github.com/facebook/three20/issues#issue/'+issue.number+'">github</a>'))
          .append(formattedBody);
        section.append(item);
      }

      $('#issues').append(section);
    }
    $('#issuetoc').append(toc);
    $('#loading').hide();
  });

});
