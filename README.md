[![Build](https://github.com/wibosco/CohabitingTrap-Example/actions/workflows/swift.yml/badge.svg)](https://github.com/wibosco/CohabitingTrap-Example/actions/workflows/swift.yml)
<a href="https://swift.org"><img src="https://img.shields.io/badge/Swift-6-orange.svg?style=flat" alt="Swift 6" /></a>
[![License](http://img.shields.io/badge/License-MIT-green.svg?style=flat)](https://github.com/wibosco/CohabitingTrap-Example/blob/main/LICENSE)

# CohabitingTrap-Example
An example project showing the dangers of how creating the wrong abstraction results in cohabiting code.

## What's Here

One workspace, `CohabitingTrap-Example.xcworkspace`, holding four projects: a pair per half of the post. Each pair is the start and the finish of that half's argument, so the two versions sit side by side.

| Pair | Project | What it holds |
| --- | --- | --- |
| `Avatar` | `AvatarCohabiting` | `AvatarView` with a flag for each caller's decoration |
| `Avatar` | `AvatarShared` | `AvatarView` with the flags gone; `ProfileHeader` and `MessageRow` add their own overlays |
| `Total` | `TotalCohabiting` | `TotalCalculator` with three flags |
| `Total` | `TotalSplit` | `Basket` and `Wishlist` each own their total; `TotalCalculator` is deleted |
