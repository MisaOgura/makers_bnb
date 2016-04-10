function dateRange(data){
  var startDate = new Date(data.date[0]);
  var endDate   = new Date(data.date[1]);
  var dateRange = [];
  for(var i = startDate.getDate(); i <= endDate.getDate(); i++){
    dateRange.push(moment(startDate.setDate(i)).format(" D MMM 'YY"));
  }
  return dateRange;
}
