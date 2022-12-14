#!/usr/bin/perl

# obmenu-generator - schema file

=for comment

    item:      add an item inside the menu               {item => ["command", "label", "icon"]},
    cat:       add a category inside the menu             {cat => ["name", "label", "icon"]},
    sep:       horizontal line separator                  {sep => undef}, {sep => "label"},
    pipe:      a pipe menu entry                         {pipe => ["command", "label", "icon"]},
    file:      include the content of an XML file        {file => "/path/to/file.xml"},
    raw:       any XML data supported by Openbox          {raw => q(...)},
    beg:       begin of a category                        {beg => ["name", "icon"]},
    end:       end of a category                          {end => undef},
    obgenmenu: generic menu settings                {obgenmenu => ["label", "icon"]},
    exit:      default "Exit" action                     {exit => ["label", "icon"]},

=cut

# NOTE:
#    * Keys and values are case sensitive. Keep all keys lowercase.
#    * ICON can be a either a direct path to an icon or a valid icon name
#    * Category names are case insensitive. (X-XFCE and x_xfce are equivalent)

require "$ENV{HOME}/.config/obmenu-generator/config.pl";

## Text editor
my $editor = $CONFIG->{editor};

our $SCHEMA = [
    {sep => 'Acceso rapido'},

    #          COMMAND                 LABEL              ICON
    {item => ['xdg-open .',       'Archivos', 'system-file-manager']},
    {item => ['sakura',            'Terminal',     'utilities-terminal']},
    {item => ['xdg-open http://', 'Web Browser',  'web-browser']},
    {item => ['gmrun',            'Ejecutar',  'system-run']},

    {sep => 'Categorias'},

    #          NAME            LABEL                ICON
    {cat => ['utility',     'Accesorios', 'applications-utilities']},
    {cat => ['development', 'Desarrollo', 'applications-development']},
    {cat => ['education',   'Educacion',   'applications-science']},
    {cat => ['game',        'Juegos',       'applications-games']},
    {cat => ['graphics',    'Graficos',    'applications-graphics']},
    {cat => ['audiovideo',  'Multimedia',  'applications-multimedia']},
    {cat => ['network',     'Network',     'applications-internet']},
    {cat => ['office',      'Oficina',      'applications-office']},
    {cat => ['other',       'Otros',       'applications-other']},
    {cat => ['settings',    'Configuracion',    'applications-accessories']},
    {cat => ['system',      'Sistema',      'applications-system']},

    #             LABEL          ICON
    #{beg => ['My category',  'cat-icon']},
    #          ... some items ...
    #{end => undef},

    #            COMMAND     LABEL        ICON
    #{pipe => ['obbrowser', 'Disk', 'drive-harddisk']},

    ## Generic advanced settings
    #{sep       => undef},
    #{obgenmenu => ['Openbox Settings', 'applications-engineering']},
    #{sep       => undef},

    ## Custom advanced settings
    {sep => undef},
    {beg => ['Configuracion Avanzada', 'applications-engineering']},

      # Configuration files
      {item => ["$editor ~/.conkyrc",              'Conky RC',    'text-x-generic']},
      {item => ["$editor ~/.config/tint2/tint2rc", 'Tint2 Panel', 'text-x-generic']},

      # obmenu-generator category
      {beg => ['Obmenu-Generator', 'accessories-text-editor']},
        {item => ["$editor ~/.config/obmenu-generator/schema.pl", 'Schema del menu', 'text-x-generic']},
        {item => ["$editor ~/.config/obmenu-generator/config.pl", 'Configuracion del menu', 'text-x-generic']},

        {sep  => undef},
        {item => ['obmenu-generator -s -c',    'Generar un menu estatico',             'accessories-text-editor']},
        {item => ['obmenu-generator -s -i -c', 'Generar un menu estatico con iconos',  'accessories-text-editor']},
        {sep  => undef},
        {item => ['obmenu-generator -p',       'Generar un menu dinamico',            'accessories-text-editor']},
        {item => ['obmenu-generator -p -i',    'Generar un menu dinamico con iconos', 'accessories-text-editor']},
        {sep  => undef},

        {item => ['obmenu-generator -d', 'Refresh cache', 'view-refresh']},
      {end => undef},

      # Openbox category
      {beg => ['Openbox', 'openbox']},
        {item => ["$editor ~/.config/openbox/autostart", 'Inicio de openbox',   'text-x-generic']},
        {item => ["$editor ~/.config/openbox/rc.xml",    'Openbox RC',          'text-x-generic']},
        {item => ["$editor ~/.config/openbox/menu.xml",  'Menu de Openbox',        'text-x-generic']},
        {item => ['openbox --reconfigure',               'Reconfigurar Openbox', 'openbox']},
      {end => undef},
    {end => undef},

    {sep => undef},

    ## The xscreensaver lock command
    {item => ['xscreensaver-command -lock', 'Lock', 'system-lock-screen']},

    ## This option uses the default Openbox's "Exit" action
    #{exit => ['Exit', 'application-exit']},

    ## This uses the 'oblogout' menu
    {exit => ['Cerrar Openbox', 'application-exit']},
]
