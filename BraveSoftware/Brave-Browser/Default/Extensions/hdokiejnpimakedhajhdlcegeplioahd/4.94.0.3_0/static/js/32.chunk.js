(window.webpackJsonpwebClient=window.webpackJsonpwebClient||[]).push([[32],{740:function(e,n){},741:function(e,n){},742:function(e,n){},743:function(e,n){},986:function(e,n,l){"use strict";l.r(n);var t=l(1),o=(l(0),l(739)),i=l(1263),a=l(870),c={id:0,type:"EnableDarkWebMonitoring",visible:!0,completed:null,seenAt:null,color:i.a.BLUE},s={complete:jest.fn(),hideExpandedSkillInDrawer:jest.fn(),toggleShowAllSkills:jest.fn(),hideSkillDetailsDialog:jest.fn(),openSecurityDashboard:jest.fn()};jest.mock("../../hooks/use-secondary-onboarding-actions",function(){return{useSecondaryOnboardingActions:function(){return s}}}),it("should shallow render the EnableDarkWebMonitoring ad component without crashing",function(){var e=Object(o.shallow)(Object(t.jsx)(a.default,{skill:c,expanded:!0,fromAllSkillsDialog:!1}));expect(e).toHaveLength(1)}),it("should open the security dashboard and be completed when the EnableDarkWebMonitoring button is clicked",function(){var e=Object(o.mount)(Object(t.jsx)(a.default,{skill:c,expanded:!0,fromAllSkillsDialog:!1}));e.find(".action-cta").at(1).simulate("click"),e.unmount(),expect(s.openSecurityDashboard).toHaveBeenCalled(),expect(s.complete).toHaveBeenCalled(),expect(s.hideExpandedSkillInDrawer).toHaveBeenCalled()}),it("should be closed when the EnableDarkWebMonitoring button is clicked from all skills",function(){var e=Object(o.mount)(Object(t.jsx)(a.default,{skill:c,expanded:!0,fromAllSkillsDialog:!0}));e.find(".action-cta").at(1).simulate("click"),e.unmount(),expect(s.openSecurityDashboard).toHaveBeenCalled(),expect(s.hideSkillDetailsDialog).toHaveBeenCalled(),expect(s.toggleShowAllSkills).toHaveBeenCalled()})}}]);