HTMLWidgets.widget({

  name: 'hive',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        // alias options
        var options = x.options;

        // convert links and nodes data frames to d3 friendly format
        var nodes = HTMLWidgets.dataframeToD3(x.nodes);
        var prelinks = HTMLWidgets.dataframeToD3(x.links);

        var links = [];
        prelinks.forEach(function(d){
          var tmp = {};
          tmp["source"]=nodes[d.source];
          tmp["target"]=nodes[d.target];
          links.push(tmp);
        })

        var innerRadius = options.innerRadius,
            outerRadius = options.outerRadius;

        var angle = d3.scale.ordinal().domain(d3.range(x.numAxis+1)).rangePoints([0, 2 * Math.PI]),
            radius = d3.scale.linear().range([innerRadius, outerRadius]),
            color = d3.scale.category10().domain(d3.range(20));

        // select the svg element and remove existing children
        var svg = d3.select(el).append("svg")
          .attr("width", width)
          .attr("height", height)
          .append("g")
          .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

        svg.selectAll(".axis")
            .data(d3.range(x.numAxis))
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
