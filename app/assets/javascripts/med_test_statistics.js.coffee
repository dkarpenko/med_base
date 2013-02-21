jQuery ->
  $(document).ready ->
    $('.tablesorter').tablesorter();



#
#
#
#
#    width = 960;
#    height = 136;
#    cellSize = 17;
#
#    day = d3.time.format("%w");
#    week = d3.time.format("%U");
#    percent = d3.format(".1%");
#    format = d3.time.format("%Y-%m-%d");
#
#    color = d3.scale.quantize().domain([-.05, .05]).range(d3.range(11).map((d) -> "q#{d}-11"))
#
#
#
#    svg = d3.select("body").selectAll("svg")
#      .data(d3.range( 2012, 2014))
#      .enter().append("svg")
#      .attr("width", width)
#      .attr("height", height)
#      .attr("class", "RdYlGn")
#      .append("g")
#      .attr("transform", "translate(" + ((width - cellSize * 53) / 2) + "," + (height - cellSize * 7 - 1) + ")");
#
#    svg.append("text")
#      .attr("transform", "translate(-6," + cellSize * 3.5 + ")rotate(-90)")
#      .style("text-anchor", "middle")
#      .text (d) -> d
#
#    m1= 0
#    rect = svg.selectAll(".day").data( (d) ->
#      d3.time.days(new Date(d, m1, 1), new Date(d + 1, m1, 1)))
#        .enter().append("rect")
#        .attr("class", "day")
#        .attr("width", cellSize)
#        .attr("height", cellSize)
#        .attr("x", (d) ->  week(d) * cellSize )
#        .attr("y", (d) -> day(d) * cellSize )
#        .datum(format);
#
#    rect.append("title").text (d) -> d
#
#
#    svg.selectAll(".month")
#      .data((d) -> d3.time.months(new Date(d, m1, 1), new Date(d + 1, m1, 1)))
#      .enter().append("path")
#      .attr("class", "month")
#      .attr("d", monthPath);
#
#    monthPath = (t0) ->
#      t1 = new Date(t0.getFullYear(), t0.getMonth() + 1, 0);
#      d0 = +day(t0);
#      w0 = +week(t0);
#      d1 = +day(t1);
#      w1 = +week(t1);
#      return "M" + (w0 + 1) * cellSize + "," + d0 * cellSize
#      +"H" + w0 * cellSize + "V" + 7 * cellSize
#      +"H" + w1 * cellSize + "V" + (d1 + 1) * cellSize
#      +"H" + (w1 + 1) * cellSize + "V" + 0
#      +"H" + (w0 + 1) * cellSize + "Z"
#
#    d3.csv "dji.csv", (error, csv) ->
#      data = d3.nest().key((d) -> d.Date).rollup((d) -> (d[0].Close - d[0].Open) / d[0].Open).map(csv)
#      rect.filter((d) -> d in data ).attr("class", (d) -> "day " + color(data[d])).select("title").text (d) -> "#{d}: #{percent(data[d])}"

#    d3.select(self.frameElement).style("height", "2910px")


#
