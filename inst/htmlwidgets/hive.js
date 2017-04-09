HTMLWidgets.widget({

  name: 'hive',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size
        d3.select(el).append("svg")
          .attr("width", width)
          .attr("height", height)
          .append("g")
          .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");
      },

      renderValue: function() {

        // alias options
        //var options = x.options;

        // convert links and nodes data frames to d3 friendly format
        //var links = HTMLWidgets.dataframeToD3(x.links);
        //var nodes = HTMLWidgets.dataframeToD3(x.nodes);
        var nodes = [
          {x: 0, y: .1},
          {x: 0, y: .9},
          {x: 1, y: .2},
          {x: 1, y: .3},
          {x: 2, y: .1},
          {x: 2, y: .8}
        ];

        var links = [
          {source: nodes[0], target: nodes[2]},
          {source: nodes[1], target: nodes[3]},
          {source: nodes[2], target: nodes[4]},
          {source: nodes[2], target: nodes[5]},
          {source: nodes[3], target: nodes[5]},
          {source: nodes[4], target: nodes[0]},
          {source: nodes[5], target: nodes[1]}
        ];

        //var innerRadius = options.innerRadius,
        //    outerRadius = options.outerRadius;
        var innerRadius = 40,
            outerRadius = 240;

        var angle = d3.scale.ordinal().domain(d3.range(4)).rangePoints([0, 2 * Math.PI]),
            radius = d3.scale.linear().range([innerRadius, outerRadius]),
            color = d3.scale.category10().domain(d3.range(20));

        // select the svg element and remove existing children
        var svg = d3.select(el).select("svg");
        svg.selectAll("*").remove();

        svg.selectAll(".axis")
            .data(d3.range(3))
          .enter().append("line")
            .attr("class", "axis")
            .attr("transform", function(d) { return "rotate(" + degrees(angle(d)) + ")"; })
            .attr("x1", radius.range()[0])
            .attr("x2", radius.range()[1]);

        svg.selectAll(".link")
            .data(links)
          .enter().append("path")
            .attr("class", "link")
            .attr("d", d3.hive.link()
            .angle(function(d) { return angle(d.x); })
            .radius(function(d) { return radius(d.y); }))
            .style("stroke", function(d) { return color(d.source.x); });

        svg.selectAll(".node")
            .data(nodes)
          .enter().append("circle")
            .attr("class", "node")
            .attr("transform", function(d) { return "rotate(" + degrees(angle(d.x)) + ")"; })
            .attr("cx", function(d) { return radius(d.y); })
            .attr("r", 5)
            .style("fill", function(d) { return color(d.x); });

        function degrees(radians) {
          return radians / Math.PI * 180 - 90;
        }

      }

    };
  }
});
