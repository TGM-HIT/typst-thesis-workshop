#import "@preview/touying:0.5.2": *
#import "theme.typ": *

#import "utils.typ": *
#import "assets/mod.typ" as assets

#set document(date: none)


#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Diplomarbeit schreiben mit Typst],
    // subtitle: [],
    author: [Clemens Koza],
    date: [2024],
    institution: [TGM, HIT],
    // logo: emoji.city,
  ),
)

#title-slide()

== Hello World

```java
public static void main(String[] args) {

}
```
