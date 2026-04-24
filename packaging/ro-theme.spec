Name:           ro-theme
Version:        0.1.0
Release:        1%{?dist}
Summary:        Ro theme package for Fedora KDE Plasma

License:        GPL-3.0-or-later
BuildArch:      noarch
Source0:        %{name}-%{version}.tar.gz

%description
Ro desktop theme package for Fedora-based KDE Plasma systems.
Includes Plasma color schemes, desktop theme, global theme skeleton,
layout template, GTK theme skeleton, icon/cursor fallback themes,
SDDM theme skeleton, Plymouth theme skeleton, and helper docs.

%prep
%autosetup

%build

%install
mkdir -p %{buildroot}%{_datadir}/color-schemes
mkdir -p %{buildroot}%{_datadir}/plasma/desktoptheme
mkdir -p %{buildroot}%{_datadir}/plasma/look-and-feel
mkdir -p %{buildroot}%{_datadir}/plasma/layout-templates
mkdir -p %{buildroot}%{_datadir}/wallpapers
mkdir -p %{buildroot}%{_datadir}/kwin/effects
mkdir -p %{buildroot}%{_datadir}/themes
mkdir -p %{buildroot}%{_datadir}/icons
mkdir -p %{buildroot}%{_datadir}/sddm/themes
mkdir -p %{buildroot}%{_datadir}/plymouth/themes
mkdir -p %{buildroot}%{_datadir}/doc/%{name}

cp -a platform/plasma/color-schemes/*.colors %{buildroot}%{_datadir}/color-schemes/
cp -a platform/plasma/desktoptheme/Ro %{buildroot}%{_datadir}/plasma/desktoptheme/
cp -a platform/plasma/look-and-feel/org.ro.global %{buildroot}%{_datadir}/plasma/look-and-feel/
cp -a platform/plasma/layout-templates/org.ro.desktop %{buildroot}%{_datadir}/plasma/layout-templates/
cp -a platform/plasma/wallpapers/Ro %{buildroot}%{_datadir}/wallpapers/
cp -a platform/kwin/effects/ro-effect %{buildroot}%{_datadir}/kwin/effects/
cp -a platform/gtk/Ro-GTK %{buildroot}%{_datadir}/themes/
cp -a platform/icons/ro-icons %{buildroot}%{_datadir}/icons/
cp -a platform/cursor/ro-cursor %{buildroot}%{_datadir}/icons/
cp -a platform/sddm/themes/Ro %{buildroot}%{_datadir}/sddm/themes/
cp -a platform/plymouth/ro-theme %{buildroot}%{_datadir}/plymouth/themes/
cp -a README.md CHANGELOG.md VERSION docs core %{buildroot}%{_datadir}/doc/%{name}/

%files
%license LICENSE
%doc README.md CHANGELOG.md VERSION docs core
%{_datadir}/color-schemes/RoDark.colors
%{_datadir}/color-schemes/RoLight.colors
%{_datadir}/plasma/desktoptheme/Ro
%{_datadir}/plasma/look-and-feel/org.ro.global
%{_datadir}/plasma/layout-templates/org.ro.desktop
%{_datadir}/wallpapers/Ro
%{_datadir}/kwin/effects/ro-effect
%{_datadir}/themes/Ro-GTK
%{_datadir}/icons/ro-icons
%{_datadir}/icons/ro-cursor
%{_datadir}/sddm/themes/Ro
%{_datadir}/plymouth/themes/ro-theme

%changelog
* Tue Mar 17 2026 Ro Team - 0.1.0-1
- Initial package skeleton with real system install paths
