# CohabitingTrap-Example
An example project showing the dangers of how creating the wrong abstraction results in cohabiting code.

## What's Here

One workspace, `CohabitingTrap-Example.xcworkspace`, holding four projects: a
pair per half of the post. Each pair is the start and the finish of that half's
argument, so the two versions sit side by side.

| Pair | Project | Section in the post | What it holds |
| --- | --- | --- | --- |
| `Avatar` | `AvatarCohabiting` | Sharing an Avatar | `AvatarView` with a flag for each caller's decoration |
| `Avatar` | `AvatarShared` | Removing What Isn't Shared | `AvatarView` with the flags gone; `ProfileHeader` and `MessageRow` add their own overlays |
| `Total` | `TotalCohabiting` | Sharing a Total, Running Out of Stock | `TotalCalculator` with three flags, after `Basket` has switched `skipOutOfStock` on |
| `Total` | `TotalSplit` | Splitting Up | `Basket` and `Wishlist` each own their total; `TotalCalculator` is deleted |
