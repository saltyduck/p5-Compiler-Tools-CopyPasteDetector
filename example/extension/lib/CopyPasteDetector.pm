package CopyPasteDetector;
use Mojo::Base 'Mojolicious';
use CopyPasteDetector::Router;
use CopyPasteDetector::Model;

# This method will run once at server start
__PACKAGE__->attr(model => sub {
    my $host = 'mysql.lo.mixi.jp';
    my $port = '';
    my $user = 'root';
    my $pass = '';
    my $dbname = 'copy_and_paste_record';
    return CopyPasteDetector::Model->new(
        {
            host => $host,
            port => $port,
            user => $user,
            pass => $pass,
            dbname => $dbname
        }
    );
});

sub startup {
  my $self = shift;
  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer');
  #$self->plugin('xslate_renderer');
  $self->routes->namespace('CopyPasteDetector::Controller');
  CopyPasteDetector::Router::dispatch($self->routes);
}

1;
