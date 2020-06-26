// pages/homepage/homepage.js
const app = getApp()
const cookieUtil = require('../../utils/cookie.js')
Page({

  /**
   * 页面的初始数据
   */
  data: {
    isLogin: null,
    userInfo: null,
    hasUserInfo: null

  },
  logout:function(){
    var that = this
    var cookie = cookieUtil.getCookieFromStorage()
    var header = {}
    header.Cookie = cookie
    wx.request({
      url: app.globalData.serviceUrl + app.globalData.apiVersion + '/auth/logout',
      method:'GET',
      header:header,
      success:function(res){
        that.setData({
          isLogin: null,
          userInfo: null,
          hasUserInfo: null
        })
        cookieUtil.setCookieToStorage('')
        app.setAuthStatus(false)
      }
    })
  },
  // navigator跳转处理
  onNavigatorTap: function (event) {
    var cookie = cookieUtil.getCookieFromStorage()
    if (cookie.length == 0) {
      wx.showToast({
        title: '尚未授权',
        icon: 'none'
      })
    
      return
    }
      // 获取由 data-type 标签传递过来的参数
      console.log(event.currentTarget.dataset.type)
      var navigatorType = event.currentTarget.dataset.type

      if (navigatorType == 'focusCity') {
        navigatorType = 'city'
      } else if (navigatorType == 'focusStock') {
        navigatorType = 'stock'
      } else {
        navigatorType = 'constellation'
      }
      var url = '../picker/picker?type=' + navigatorType
      wx.navigateTo({
        url: '../picker/picker?type=' + navigatorType,
      })
    
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this
    var cookie = cookieUtil.getCookieFromStorage()
    var header = {}
    header.Cookie = cookie
    wx.request({
      url: app.globalData.serviceUrl + app.globalData.apiVersion + '/auth/status',
      method:'GET',
      header:header,
      success:function(res){
        var data = res.data.data
        if (data.is_authorized==1){
          that.setData({
            isLogin: true,
            userInfo: app.globalData.userInfo,
            hasUserInfo: true
          })
          app.setAuthStatus(true)
        }
      }
    })
  },
  onAuthorizeConfirm:function(res){
    var userInfo = res.detail.userInfo
    app.globalData.userInfo = userInfo
    this.authorize()

  },
  authorize:function(res){
    var that = this
    wx.login({
      success:function(res){
        var code = res.code
        var appid = app.globalData.appid
        var nickName = app.globalData.userInfo.nickName
        wx.request({
          url: app.globalData.serviceUrl + app.globalData.apiVersion + '/auth/authorize',
          method:'POST',
          data:{
            code:code,
            appid:appid,
            nickName:nickName
          },
          success:function(res){
            wx.showToast({
              title: '授权成功',
            })
            var cookie = cookieUtil.getSessionIDFromResponse(res)
            cookieUtil.setCookieToStorage(cookie)
            that.setData({
              isLogin:true,
              userInfo:app.globalData.userInfo,
              hasUserInfo:true
            })
            app.setAuthStatus(true)
          }
        })
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