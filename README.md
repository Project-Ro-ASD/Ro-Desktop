# 🎨 Ro Theme

Modern, modüler ve sistem seviyesinde bir Linux masaüstü tema altyapısı.
(KDE Plasma odaklı, genişletilebilir mimari)

---

## 🚀 Amaç

Ro Theme, sadece bir tema değil;
**layout, renk sistemi ve platform entegrasyonlarını kapsayan tam bir UI sistemi**dir.

---

## ✨ Özellikler

* 🧠 Gelişmiş layout sistemi (panel + dock)
* 🎨 Light & Dark tema desteği
* 🧱 Design token mimarisi (colors, spacing, radius, opacity)
* 🖥 KDE Plasma entegrasyonu
* ⚙️ Script tabanlı geliştirme sistemi
* 📦 Modüler platform yapısı (Plasma / GTK / Icons / Cursor)

---

## 📁 Proje Yapısı

```
core/        → Design system (tokens + default layout)
platform/    → OS entegrasyonları (Plasma, GTK, Icons, Cursor)
scripts/     → Geliştirme ve araç scriptleri
docs/        → Dokümantasyon
assets/      → Görsel kaynaklar
```

---

## 🧠 Mimari

### Layout Sistemi

```
test-layout (lokal) → geliştirme
default-layout      → kayıtlı sonuç
layout.js           → kullanıcıya giden final layout
```

---

### Tema Sistemi

```
colors.json         → ana renk kaynağı
RoLight / RoDark    → KDE uyumlu tema
```

---

## 🧪 Geliştirme

Layout geliştirmek için:

```bash
./scripts/dev-layout.sh
```

### Bu script:

* test layout'u uygular
* plasmashell’e yükler
* sonucu `core/default-layout` içine kaydeder

---

## 📜 Scriptler

### dev-layout.sh

Layout geliştirme ve kaydetme scripti

### build.sh

Dağıtım (build) işlemleri

### install-local.sh

Temayı lokal sisteme kurar

### validate.sh

Proje yapısını kontrol eder

---

## 🎨 Design Tokens

```
core/tokens/
```

* `colors.json` → renk sistemi
* `spacing.json` → boşluklar
* `radius.json` → border radius
* `opacity.json` → şeffaflık
* `motion.json` → animasyon

---

## 🧩 Platform Katmanları

### KDE Plasma

```
platform/plasma/
```

* color-schemes → RoLight / RoDark
* desktoptheme → panel & widget görünümü
* layout-templates → default layout (layout.js)
* look-and-feel → global theme paketi
* wallpapers → varsayılan duvar kağıdı

---

### GTK

```
platform/gtk/
```

GTK uygulama uyumluluğu

---

### Icons

```
platform/icons/
```

ikon sistemi

---

### Cursor

```
platform/cursor/
```

cursor teması

---

### Sistem Bileşenleri

* plymouth → boot animasyonu
* sddm → login ekranı
* splash → açılış ekranı

---

## 📚 Dokümantasyon

```
docs/
```

* ownership.md → görev dağılımı
* rules.md → proje kuralları
* style-guide.md → tasarım kuralları
* roadmap.md → plan
* release-checklist.md → release süreci

---

## 🔢 Versiyonlama

Bu proje şu formatı kullanır:

```
MAJOR.MINOR.PATCH
```

Örnek:

```
0.2.0
```

| Tür   | Açıklama                |
| ----- | ----------------------- |
| MAJOR | büyük kırıcı değişiklik |
| MINOR | yeni özellik            |
| PATCH | küçük düzeltme          |

Versiyon:

```
VERSION
```

---

## 🚀 Release Akışı

1. VERSION güncelle
2. CHANGELOG.md yaz
3. validate çalıştır
4. build al
5. push + release

---

## ⚠️ Kurallar

* Herkes kendi alanında çalışır
* Test edilmeden commit yapılmaz
* Layout bitmeden `layout.js` kullanılmaz
* Token yapısı korunur

---

## 👥 Roller

* Layout → yapı ve hizalama
* Theme → görsel katman
* Integration → sistem entegrasyonu
* UX → cross-platform uyum

---

## 🎯 Hedef

Tüm sistem genelinde tutarlı, modern ve yüksek kaliteli bir kullanıcı deneyimi sunmak.

---
