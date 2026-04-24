// Tüm mevcut panelleri temizler
panels().forEach(function (panel) {
    panel.remove();
});

// Üst bar yüksekliği
var TOP_PANEL_HEIGHT = 34;

// Alt dock yüksekliği
var DOCK_HEIGHT = 62;

// Alt dock'un ekrandan yukarı boşluğu
var DOCK_OFFSET = 26;

// Dock genişliği için temel değer
var BASE_DOCK_WIDTH = 300;

// Her launcher için eklenecek genişlik
var WIDTH_PER_APP = 72;

// Dock'ta gösterilecek başlangıç uygulamaları
var DOCK_LAUNCHERS = [
    "applications:org.kde.dolphin.desktop",
    "applications:org.kde.konsole.desktop",
    "applications:firefox.desktop",
    "applications:code.desktop",
    "applications:org.kde.discover.desktop"
];

// Dock minimum genişliği
var DOCK_MIN_LENGTH = BASE_DOCK_WIDTH;

// Dock maksimum genişliği
var DOCK_MAX_LENGTH = BASE_DOCK_WIDTH + (DOCK_LAUNCHERS.length * WIDTH_PER_APP);

// Launcher sayısına göre ikon boyutu
var DOCK_ICON_SIZE = DOCK_LAUNCHERS.length > 6 ? 42 : 48;

// Tekrarlanan panel ayarlarını kısaltmak için yardımcı fonksiyon
function createPanel(options) {
    var panel = new Panel;

    panel.location = options.location;
    panel.height = options.height;
    panel.alignment = options.alignment || "center";
    panel.lengthMode = options.lengthMode || "fit";
    panel.minimumLength = options.minLength || 0;
    panel.maximumLength = options.maxLength || 10000;
    panel.floating = true;
    panel.hiding = "none";

    if (options.offset !== undefined) {
        panel.offset = options.offset;
    }

    return panel;
}

// Üst barı oluşturur
var topPanel = new Panel;
topPanel.location = "top";
topPanel.height = TOP_PANEL_HEIGHT;
topPanel.lengthMode = "fill";
topPanel.floating = true;
topPanel.hiding = "none";

// Sol alan: uygulama başlatıcı
var kickoff = topPanel.addWidget("org.kde.plasma.kickoff");
kickoff.currentConfigGroup = ["General"];
kickoff.writeConfig("icon", "start-here-kde");

// Sol alan ile orta alan arasına sabit boşluk ekler
var spacerLeftFixed = topPanel.addWidget("org.kde.plasma.panelspacer");
spacerLeftFixed.currentConfigGroup = ["General"];
spacerLeftFixed.writeConfig("expanding", false);
spacerLeftFixed.writeConfig("length", 12);

// Saati merkeze itmek için esneyen boşluk
var spacerLeftFlex = topPanel.addWidget("org.kde.plasma.panelspacer");
spacerLeftFlex.currentConfigGroup = ["General"];
spacerLeftFlex.writeConfig("expanding", true);

// Orta alan: saat
var clock = topPanel.addWidget("org.kde.plasma.digitalclock");
clock.currentConfigGroup = ["Appearance"];
clock.writeConfig("showDate", true);
clock.writeConfig("use24hFormat", true);

// Saati merkezde tutmak için ikinci esneyen boşluk
var spacerRightFlex = topPanel.addWidget("org.kde.plasma.panelspacer");
spacerRightFlex.currentConfigGroup = ["General"];
spacerRightFlex.writeConfig("expanding", true);

// Sağ alan öncesi sabit boşluk
var spacerRightFixed = topPanel.addWidget("org.kde.plasma.panelspacer");
spacerRightFixed.currentConfigGroup = ["General"];
spacerRightFixed.writeConfig("expanding", false);
spacerRightFixed.writeConfig("length", 12);

// Sağ alan: sistem tepsisi
var tray = topPanel.addWidget("org.kde.plasma.systemtray");

// Alt dock panelini oluşturur
var dockPanel = createPanel({
    location: "bottom",
    height: DOCK_HEIGHT,
    alignment: "center",
    minLength: DOCK_MIN_LENGTH,
    maxLength: DOCK_MAX_LENGTH,
    offset: DOCK_OFFSET
});

// Dock içeriği: ikon görev yöneticisi
var tasks = dockPanel.addWidget("org.kde.plasma.icontasks");
tasks.currentConfigGroup = ["General"];

// Dock ikon boyutu
tasks.writeConfig("iconSize", DOCK_ICON_SIZE);

// Uygulamaları gruplayıp klasik taskbar gibi davranmaması için kapalı
tasks.writeConfig("groupingStrategy", 0);

// Sadece aktif masaüstündeki pencereleri göstermesi için açık
tasks.writeConfig("showOnlyCurrentDesktop", true);

// Başlangıç launcher listesi
tasks.writeConfig("launchers", DOCK_LAUNCHERS);
