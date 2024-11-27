library(ggplot2)
library(tidyverse)

# THEME FUNCTION
theme_dos <- function(color = "#99FFFF") {  # Added argument for border color
  ggplot2::theme(
    # Background
    panel.background = ggplot2::element_rect(fill = "#1C1C1C", color = NA),
    plot.background = ggplot2::element_rect(fill = "#1C1C1C", color = color, size = 2),  # Use color argument
    legend.background = ggplot2::element_rect(fill = "#1C1C1C", color = color),
    legend.key = ggplot2::element_rect(fill = "#1C1C1C", color = "#1C1C1C"),

    # Remove gridlines
    panel.grid.major = ggplot2::element_blank(),
    panel.grid.minor = ggplot2::element_blank(),

    # Blocky axis lines
    axis.line = ggplot2::element_line(color = color, size = 1),  # Use color argument

    # Axis titles and text (same size and bold)
    axis.text.x = ggplot2::element_text(
      color = color,
      family = "Courier New",
      size = 12,
      face = "bold"
    ),
    axis.text.y = ggplot2::element_text(
      color = color,
      family = "Courier New",
      size = 12,
      face = "bold"
    ),
    axis.title = ggplot2::element_text(
      color = color,
      family = "Courier New",
      size = 12,
      face = "bold"
    ),

    # Plot title and subtitle (same size and bold)
    plot.title = ggplot2::element_text(
      color = color,
      family = "Courier New",
      size = 12,
      face = "bold",
      lineheight = 0.8,
      margin = ggplot2::margin(b = 10),
      vjust = 0.5
    ),
    plot.subtitle = ggplot2::element_text(
      color = color,
      family = "Courier New",
      size = 12,
      face = "bold",  # Make subtitle bold
      hjust = 0,
      vjust = 1
    ),

    # Legend text and title (same size and bold)
    legend.text = ggplot2::element_text(
      color = color,
      family = "Courier New",
      size = 12,
      face = "bold"
    ),
    legend.title = ggplot2::element_text(
      color = color,
      family = "Courier New",
      size = 12,
      face = "bold"
    ),

    # Strip background for faceting
    strip.background = ggplot2::element_rect(fill = "#1C1C1C", color = color),  # Use color argument
    strip.text = ggplot2::element_text(
      color = color,
      family = "Courier New",
      size = 12,
      face = "bold"
    ),

    plot.margin = grid::unit(c(1, 1, 1, 1), "cm")
  )
}

# HELPER/COMPANION FUNCTIONS
dosify <- function(geom_layer, size = 1, fill = "#99FFFF", colour = "#99FFFF", ...) {
  geom_layer(size = size, fill = fill, colour = colour, ...)
}

# DOS-Friendly Color Palette
dos_colors <- c(
  "#99FFFF",  # Light Cyan
  "#FF00FF",  # Magenta
  "#FFFF00",  # Yellow
  "#FF0000",  # Red
  "#00FF00",  # Green
  "#0000FF",  # Blue
  "#FFFFFF",  # White
  "#000000"   # Black
)

# Scale Color function for DOS-inspired palette
dos_color <- function() {
  ggplot2::scale_color_manual(values = dos_colors)
}

# Scale Fill function for DOS-inspired palette
dos_fill <- function() {
  ggplot2::scale_fill_manual(values = dos_colors)
}

# EXAMPLES
ggplot(mpg, aes(x = displ, y = hwy)) +
  dosify(geom_point) +
  ggtitle("DOS Style Plot", subtitle = "Retro vibes in ggplot2") +
  theme_dos() +
  dos_color()

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_col() +
  facet_wrap(~class) +
  ggtitle("DOS Style Faceted Bar Plot", subtitle = "Faceted by Car Class") +
  theme_dos() +
  dos_color()

ggplot(mpg, aes(x = displ, y = hwy)) +
  dosify(geom_violin) +
  ggtitle("DOS Style Violin Plot", subtitle = "Distribution of Highway Mileage by Displacement") +
  theme_dos() +
  dos_fill()
