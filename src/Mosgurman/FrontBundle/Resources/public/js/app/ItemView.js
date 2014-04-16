/**
 * Created by Yury Smidovich (Stmol)
 * Date: 16.04.14
 * Project: mosgurman
 * Url: http://stmol.me
 * Email: dev@stmol.me
 */

'use strict';

var MGApp = MGApp || {};

MGApp.ItemView = Backbone.View.extend({

  events: {
    'click input[type="submit"]': 'onSubmitClick'
  },

  initialize: function (options) {
    this.jcf = options.jcf;

    this.listenTo(this.collection, 'add', this.addProductToCart);
  },

  onSubmitClick: function (e) {
    e.preventDefault();

    var self = this;

    this.$('ul').children('li').each(function (idx, li) {
      var $select = $(li).children('select');

      if ($select.val() != 0) {
        self.collection.add({
          item:   $select.parent().data('product-id'),
          count:  $select.val(),
          weight: $select.parent().data('product-weigth')
        });

        $select.children('option:first').prop('selected', true);
        self.jcf.customForms.refreshAll();
      }
    });

    console.log(this.collection);
  },

  addProductToCart: function (model) {
    model.save();
    this.redrawProductCount();
  },

  redrawProductCount: function () {
    $('.cart > .number > a').text(this.collection.length);
  }

});
