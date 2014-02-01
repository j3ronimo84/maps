// Generated by CoffeeScript 1.6.3
j3r.MarkersController = (function() {
  MarkersController.wrapper = 'menu-wrapper';

  function MarkersController(markersList, markers, categories, selected) {
    this.markersList = markersList;
    this.markers = markers;
    this.categories = categories;
    this.selected = selected;
  }

  MarkersController.prototype.init = function() {
    var mainCategoryId, selectedCategoryId, _ref;
    _ref = this.selected;
    for (mainCategoryId in _ref) {
      selectedCategoryId = _ref[mainCategoryId];
      this.renderSelector(mainCategoryId, selectedCategoryId);
    }
  };

  MarkersController.prototype.setSelections = function(mainCategory, selection) {
    var wrapper;
    wrapper = $('#' + this.getParentId(selection));
    if (wrapper.length > 0) {
      wrapper.html('');
    }
    if (this.categories['list'][selection] != null) {
      this.renderSelector(mainCategory, selection);
    }
    this.selected[mainCategory] = selection;
    this.setMarkers();
  };

  MarkersController.prototype.renderSelector = function(mainCategoryId, categoryId) {
    var optionId, optionName, parrentId, selector, wrapper, _ref;
    parrentId = this.getParentId(categoryId);
    selector = $('<select id="' + categoryId + '" onChange="app.select($(\'#' + categoryId + ' option:selected\').attr(\'data-main-cat\'),$(\'#' + categoryId + ' option:selected\').attr(\'data-selected-cat\'))"><select>');
    selector.append('<option disabled selected>' + this.categories['titles'][categoryId] + '</option>');
    _ref = this.categories['list'][categoryId];
    for (optionId in _ref) {
      optionName = _ref[optionId];
      selector.append('<option data-main-cat="' + mainCategoryId + '" data-selected-cat="' + optionId + '">' + optionName + '</option>');
    }
    wrapper = $('#' + parrentId);
    if (wrapper.length === 0) {
      wrapper = $('<div id="' + parrentId + '"></div>');
      $('#selectors-wrapper').append(wrapper);
    }
    wrapper.append(selector);
  };

  MarkersController.prototype.getParentId = function(categoryId) {
    var mainCatEnd, parrentId;
    mainCatEnd = categoryId.lastIndexOf('_');
    parrentId = mainCatEnd !== -1 ? 'wrapper-' + categoryId.substr(0, mainCatEnd) : j3r.MarkersController.wrapper;
    return parrentId;
  };

  MarkersController.prototype.setMarkers = function() {
    var categoryId, mainCategoryId, markerId, markerInfo, newMarkers, _ref, _ref1;
    newMarkers = {};
    _ref = this.markersList;
    for (markerId in _ref) {
      markerInfo = _ref[markerId];
      newMarkers[markerId] = true;
      _ref1 = this.selected;
      for (mainCategoryId in _ref1) {
        categoryId = _ref1[mainCategoryId];
        if (markerInfo['cat'].indexOf(categoryId) === -1) {
          delete newMarkers[markerId];
          break;
        }
      }
    }
    this.markers.setMarkers(newMarkers);
  };

  return MarkersController;

})();

j3r.MarkersController.create = function(markers) {
  return new j3r.MarkersController(j3r.conf.markers, markers, {
    'list': j3r.conf['categories']['list'],
    'titles': j3r.conf['categories']['titles']
  }, j3r.conf['categories']['init']);
};
