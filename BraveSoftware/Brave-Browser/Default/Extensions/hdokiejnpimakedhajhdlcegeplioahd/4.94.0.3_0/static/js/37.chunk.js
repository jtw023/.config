(window.webpackJsonpwebClient=window.webpackJsonpwebClient||[]).push([[37],{740:function(e,t){},741:function(e,t){},742:function(e,t){},743:function(e,t){},995:function(e,t,n){"use strict";n.r(t);var o=n(7),r=n(1),c=(n(0),n(739)),a=n(1263),s=n(867),i=n(9),u={id:0,type:"StayConnectedAnywhere",visible:!0,completed:null,seenAt:null,color:a.a.GREY,requestError:!1},l={checkStayConnectedCompletion:jest.fn(),setRequestInProgress:jest.fn()};jest.mock("../../hooks/use-secondary-onboarding-actions",function(){return{useSecondaryOnboardingActions:function(){return l}}}),jest.mock("react-redux",function(){return Object(o.a)({},jest.requireActual("react-redux"),{useSelector:jest.fn().mockReturnValueOnce({secondaryOnboarding:{requestInProgress:!1}})})});var d=function(e){return Object(c.mount)(Object(r.jsx)(s.default,{skill:e,expanded:!0,fromAllSkillsDialog:!1}))};describe("StayConnectedAnywhere Skill component",function(){afterEach(function(){i.f.mockClear()}),it("should shallow render without crashing",function(){var e=Object(c.shallow)(Object(r.jsx)(s.default,{skill:u,expanded:!0,fromAllSkillsDialog:!1}));expect(e).toHaveLength(1)}),it("should mount render and click the Already logged-in button",function(){jest.useFakeTimers();var e=d(u);e.find(".action-cta").at(1).simulate("click"),e.unmount(),expect(l.setRequestInProgress).toHaveBeenCalled(),jest.advanceTimersByTime(1e3),expect(l.checkStayConnectedCompletion).toHaveBeenCalled(),jest.useRealTimers()}),it("should mount render and show Alert on failed request",function(){jest.useFakeTimers();var e=Object(o.a)({},u,{requestError:!0}),t=d(e),n=t.find(".action-cta").at(1),r=t.find("#stayConnectedAnywhereAlert").at(1);t.unmount(),expect(n).toHaveLength(0),expect(r).toHaveLength(1)})})}}]);