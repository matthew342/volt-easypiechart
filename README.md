# Volt::Easypiechart

A simple Volt component to use the [EasyPieChart](http://rendro.github.io/easy-pie-chart/) JS library.

## Installation

Add this line to your application's Gemfile:

    gem 'volt-easypiechart'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install volt-easypiechart

## Usage

Doing something like this in your template:

```
<:easypiechart percent="{{ page._percent }}"
  classes="sub-pie-1"
  pie-title="Bounce Rate"
  options='{"size": 95, "trackColor": "#eee", "scaleColor": "#ccc", "barColor": "#2196F3", "lineWidth": 4,
  "lineCap": "butt"}'/>
```

will produce something like this in your final output:
```
<div id="id10089" class="easy-pie sub-pie-1" data-percent="54">
    <div class="percent"><!-- $10090 -->54<!-- $/10090 --></div>
    <!-- $10091 -->
      <div class="pie-title"><!-- $10092 -->Bounce Rate<!-- $/10092 --></div>
    <!-- $/10091 -->
  <canvas height="95" width="95"></canvas>
</div>
```

See the EasyPieChart [repo](https://github.com/rendro/easy-pie-chart) for a full reference on usage. Here are the options available for quick reference:

Property (Type) | Default | Description
-------- | --------- | ----------
 **barColor** | #ef1e25 | The color of the curcular bar. You can either pass a valid css color string, or a function that takes the current percentage as a value and returns a valid css color string.
**trackColor** | #f2f2f2 | The color of the track, or false to disable rendering. |
**scaleColor** | #dfe0e0 | The color of the scale lines, false to disable rendering. |
**scaleLength** | 5 | Length of the scale lines (reduces the radius of the chart). |
**lineCap** | round | Defines how the ending of the bar line looks like. Possible values are: `butt`, `round` and `square`. |
**lineWidth** | 3 | Width of the chart line in px. |
**size** | 110 | Size of the pie chart in px. It will always be a square. |
**rotate** | 0 | Rotation of the complete chart in degrees. |
**animate** | object | Object with time in milliseconds and boolean for an animation of the bar growing (`{ duration: 1000, enabled: true }`), or false to deactivate animations. |
**easing** | defaultEasing | Easing function or string with the name of a [jQuery easing function](http://gsgd.co.uk/sandbox/jquery/easing/) |


## Contributing

1. Fork it ( http://github.com/matthew342/volt-easypiechart/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Attribution
EasyPieChart is copyright 2015 Robert Fleischmann, contributors. Find it on [Github](https://github.com/rendro/easy-pie-chart).
