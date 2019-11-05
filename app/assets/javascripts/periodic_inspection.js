$(document).ready(function() {
  const elementId = $('#periodic-inspection-form').action.split('elements/')[1].split("/preuse")[0]

  $('#periodic_inspection_date').on('change', (event) => {
    debugger;
    $.ajax({
      url: `/elements/${elementId}/periodic_inspections/${event.target.value}`
    })
  });
});