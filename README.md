# bucu_shared

> Central shared items database, constants, helper utilities, and database schema for the BUCU Framework ecosystem.

---

## 🌟 Overview

`bucu_shared` serves as the foundational data registry across the entire BUCU Framework. It defines master item attributes, weight calculation engines, serial number generators, and standard database tables.

## 📦 Features
- **Bilingual Master Items**: Built-in definitions for 25+ essential items in English and Indonesian.
- **Physical Documents**: Support for unique identification documents (`id_card`, `driver_license`).
- **Gameplay Buffs**: Items with custom status durations (`steak`, `painkiller`, `coffee`).
- **Standard Database Schema**: Automatic table migration definitions for `bucu_inventories`, `bucu_banking_transactions`, `bucu_vehicles`, and more.

## 📥 Installation
```cfg
ensure oxmysql
ensure bucu_core
ensure bucu_shared
```

## 📜 License
Part of the BUCU Framework. Licensed under the MIT License.
