$(document).on('turbolinks:load', function(){
  $(document).on('keyup', '#search-form', function(e){
    e.preventDefault();
    var input = $.trim($(this).val());
    $.ajax({
      url: '/foods/search',
      type: 'GET',
      data: ('keyword=' + input),
      processData: false,
      contentType: false,
      dataType: 'json'
    })
      .done(function(data){
        $('#result').find('input[type="radio"]').remove();
        $('#result').find('label.label-radio').remove();
        $(data).each(function(i, kind){
          $('#result').append(
            `<div><input type="radio" value="${kind.id}" name="food[kind_id]" id="food_kind_id_${kind.id}"><label for="food_kind_id_${kind.id}" class="label-radio">${kind.kindname}</label></div>`
          )
        });
      })
  });
});
