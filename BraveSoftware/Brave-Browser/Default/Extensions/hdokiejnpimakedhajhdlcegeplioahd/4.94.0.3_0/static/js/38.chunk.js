(window.webpackJsonpwebClient=window.webpackJsonpwebClient||[]).push([[38],{740:function(e,n){},741:function(e,n){},742:function(e,n){},743:function(e,n){},997:function(e,n,t){"use strict";t.r(n);var i=t(7),o=t(1),l=(t(0),t(739)),c=t(1263),u=t(878),a={id:0,type:"TryAutoFill",visible:!0,completed:null,seenAt:null,color:c.a.GREEN},r={complete:jest.fn(),hideExpandedSkillInDrawer:jest.fn()};jest.mock("../../hooks/use-secondary-onboarding-actions",function(){return{useSecondaryOnboardingActions:function(){return r}}}),jest.mock("react-redux",function(){return Object(i.a)({},jest.requireActual("react-redux"),{useSelector:jest.fn().mockReturnValueOnce({settings:{features:{new_infield_design_for_onboarding:!0}}})})});var d=function(e){return Object(l.mount)(Object(o.jsx)(u.default,{skill:e,expanded:!0,fromAllSkillsDialog:!1}))};it("should render the TryAutoFill component without crashing",function(){var e=d(a);expect(e).toHaveLength(1)}),it('should invoke the complete function when clicking the input, after "fill" and finally "All set" action button',function(){var e=d(a);e.find("input.autofill-input").simulate("click"),e.find("div.old-infield-menu-item").simulate("click"),e.find("button.action-cta").simulate("click"),e.unmount(),expect(r.complete).toHaveBeenCalled(),expect(r.hideExpandedSkillInDrawer).toHaveBeenCalled()})}}]);