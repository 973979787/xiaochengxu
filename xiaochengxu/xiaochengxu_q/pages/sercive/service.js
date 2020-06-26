// pages/sercive/service.js
var app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    isConstellationView: false,
    isJokeView: false,
    constellationData: null,
    jokeData: null
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var isConstellationtmp = false
    var isJokeViewtmp =false
    if(options.type=='constellation'){
      isConstellationtmp = true
      this.updateConstellation()
      this.setData({
        isConstellationView: isConstellationtmp
      })
    }
    else if(options.type=='joke'){
      isJokeViewtmp = true
      this.updateJokeView()
      this.setData({
        isJokeView: isJokeViewtmp
      })
    }
  },
  updateJokeView:function(res){
    var that = this
    wx.showLoading({
      title: '加载中',
    })
    wx.request({
      url: app.globalData.serviceUrl + app.globalData.apiVersion + '/service/joke/',
      method: 'GET',
      success: function (res) {
        that.setData({
          jokeData: res.data.data
        })
        wx.hideLoading()
      }
    }) 
  },
  updateConstellation:function(res){
    var that = this
    wx.showLoading({
      title: '加载中',
    })
    wx.request({
      url: app.globalData.serviceUrl + app.globalData.apiVersion + '/service/constellation/',
      method:'GET',
      success:function(res){
        that.setData({
          constellationData:res.data.data
        })
        wx.hideLoading()
      }
    }) 
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})