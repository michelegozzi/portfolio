var iconCarousel;
var iconName;
var iconClass;
var changeIcon;
var notSelectedIconWarning;
var selectedIconName;
var selectedIconClass;

jQuery(document).ready(function() {
  iconCarousel = jQuery('#iconCarousel');
  iconName = jQuery('#sector_icon_name');
  iconClass = jQuery('#sector_icon_class');
  changeIcon = jQuery('#change_icon');
  notSelectedIconWarning = jQuery('#not_selected_icon_warning');
  selectedIconName = jQuery('#selected_icon_name');
  selectedIconClass = jQuery('#selected_icon_class');

  iconCarousel.hide();

  if (iconName.attr('value') && iconClass.attr('value')) {
    selectedIconName.html(iconName.attr('value')).show();
    selectedIconClass.addClass(iconClass.attr('value')).show();
    notSelectedIconWarning.hide();
  }
  else {
    selectedIconName.hide();
    selectedIconClass.hide();
    notSelectedIconWarning.show();
  }

  iconCarousel.find('span').each(function() {
    //console.debug($(this));
    //console.debug(this);
    //console.debug('class:' + $(e).css());
    $(this).clickIcon();
    $(this).siblings('i').clickIcon();
  });

  changeIcon.click(function() {
    iconCarousel.toggle();
  });
});

jQuery.fn.clickIcon = function() {
  $(this).click(function() {
    var eName = $(this).siblings('input#element_name').first().val();
    var eClass = $(this).siblings('input#element_class').first().val();
    //console.debug('name:' + eName);
    //console.debug('class:' + eClass);

    // remove the previous selected class
    selectedIconClass.removeClass(iconClass.val());

    // update hidden form fields
    iconName.val(eName);
    iconClass.val(eClass);

    selectedIconName.html(eName).show();
    selectedIconClass.addClass(eClass).show();
    notSelectedIconWarning.hide();
  });

  return this;
}