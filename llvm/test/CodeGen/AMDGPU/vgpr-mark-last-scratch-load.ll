; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py UTC_ARGS: --version 4
; RUN: llc -mtriple=amdgcn -mcpu=gfx1200 -o - %s | FileCheck -check-prefix=CHECK %s

define amdgpu_cs void @max_6_vgprs(ptr addrspace(1) %p) "amdgpu-num-vgpr"="6" {
; CHECK-LABEL: max_6_vgprs:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    global_load_b32 v2, v[0:1], off scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    v_ashrrev_i32_e32 v3, 31, v2
; CHECK-NEXT:    s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_1)
; CHECK-NEXT:    v_lshlrev_b64_e32 v[2:3], 2, v[2:3]
; CHECK-NEXT:    v_add_co_u32 v0, vcc_lo, v0, v2
; CHECK-NEXT:    s_delay_alu instid0(VALU_DEP_1)
; CHECK-NEXT:    v_add_co_ci_u32_e64 v1, null, v1, v3, vcc_lo
; CHECK-NEXT:    global_load_b32 v5, v[0:1], off scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    global_load_b32 v2, v[0:1], off offset:16 scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    scratch_store_b32 off, v2, off ; 4-byte Folded Spill
; CHECK-NEXT:    global_load_b32 v2, v[0:1], off offset:48 scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    scratch_store_b32 off, v2, off offset:4 ; 4-byte Folded Spill
; CHECK-NEXT:    global_load_b32 v2, v[0:1], off offset:96 scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    scratch_store_b32 off, v2, off offset:8 ; 4-byte Folded Spill
; CHECK-NEXT:    global_load_b32 v0, v[0:1], off offset:160 scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    scratch_store_b32 off, v0, off offset:12 ; 4-byte Folded Spill
; CHECK-NEXT:    ;;#ASMSTART
; CHECK-NEXT:    ;;#ASMEND
; CHECK-NEXT:    s_wait_storecnt 0x0
; CHECK-NEXT:    global_store_b32 v[0:1], v5, off scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_storecnt 0x0
; CHECK-NEXT:    scratch_load_b32 v0, off, off th:TH_LOAD_LU ; 4-byte Folded Reload
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    global_store_b32 v[0:1], v0, off scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_storecnt 0x0
; CHECK-NEXT:    scratch_load_b32 v0, off, off offset:4 th:TH_LOAD_LU ; 4-byte Folded Reload
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    global_store_b32 v[0:1], v0, off scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_storecnt 0x0
; CHECK-NEXT:    scratch_load_b32 v0, off, off offset:8 th:TH_LOAD_LU ; 4-byte Folded Reload
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    global_store_b32 v[0:1], v0, off scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_storecnt 0x0
; CHECK-NEXT:    scratch_load_b32 v0, off, off offset:12 th:TH_LOAD_LU ; 4-byte Folded Reload
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    global_store_b32 v[0:1], v0, off scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_storecnt 0x0
; CHECK-NEXT:    s_endpgm
  %tid = load volatile i32, ptr addrspace(1) poison
  %p1 = getelementptr inbounds i32, ptr addrspace(1) %p, i32 %tid
  %p2 = getelementptr inbounds i32, ptr addrspace(1) %p1, i32 4
  %p3 = getelementptr inbounds i32, ptr addrspace(1) %p2, i32 8
  %p4 = getelementptr inbounds i32, ptr addrspace(1) %p3, i32 12
  %p5 = getelementptr inbounds i32, ptr addrspace(1) %p4, i32 16
  %v1 = load volatile i32, ptr addrspace(1) %p1
  %v2 = load volatile i32, ptr addrspace(1) %p2
  %v3 = load volatile i32, ptr addrspace(1) %p3
  %v4 = load volatile i32, ptr addrspace(1) %p4
  %v5 = load volatile i32, ptr addrspace(1) %p5
  call void asm sideeffect "", "~{v[0:4]}" ()
  store volatile i32 %v1, ptr addrspace(1) poison
  store volatile i32 %v2, ptr addrspace(1) poison
  store volatile i32 %v3, ptr addrspace(1) poison
  store volatile i32 %v4, ptr addrspace(1) poison
  store volatile i32 %v5, ptr addrspace(1) poison
  ret void
}

define amdgpu_cs void @max_11_vgprs_branch(ptr addrspace(1) %p, i32 %tmp) "amdgpu-num-vgpr"="11" {
; CHECK-LABEL: max_11_vgprs_branch:
; CHECK:       ; %bb.0: ; %.entry
; CHECK-NEXT:    global_load_b32 v3, v[0:1], off scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    s_mov_b32 s0, exec_lo
; CHECK-NEXT:    v_ashrrev_i32_e32 v4, 31, v3
; CHECK-NEXT:    s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_1)
; CHECK-NEXT:    v_lshlrev_b64_e32 v[3:4], 2, v[3:4]
; CHECK-NEXT:    v_add_co_u32 v0, vcc_lo, v0, v3
; CHECK-NEXT:    s_delay_alu instid0(VALU_DEP_1)
; CHECK-NEXT:    v_add_co_ci_u32_e64 v1, null, v1, v4, vcc_lo
; CHECK-NEXT:    global_load_b32 v3, v[0:1], off offset:336 scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    scratch_store_b32 off, v3, off offset:8 ; 4-byte Folded Spill
; CHECK-NEXT:    global_load_b32 v3, v[0:1], off offset:448 scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    scratch_store_b32 off, v3, off offset:12 ; 4-byte Folded Spill
; CHECK-NEXT:    global_load_b32 v3, v[0:1], off offset:576 scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    scratch_store_b32 off, v3, off ; 4-byte Folded Spill
; CHECK-NEXT:    global_load_b32 v3, v[0:1], off offset:720 scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    scratch_store_b32 off, v3, off offset:4 ; 4-byte Folded Spill
; CHECK-NEXT:    v_cmpx_eq_u32_e32 0, v2
; CHECK-NEXT:    s_xor_b32 s0, exec_lo, s0
; CHECK-NEXT:    s_cbranch_execz .LBB1_2
; CHECK-NEXT:  ; %bb.1: ; %.false
; CHECK-NEXT:    global_load_b32 v10, v[0:1], off scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    global_load_b32 v2, v[0:1], off offset:16 scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    scratch_store_b32 off, v2, off offset:16 ; 4-byte Folded Spill
; CHECK-NEXT:    global_load_b32 v2, v[0:1], off offset:48 scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    scratch_store_b32 off, v2, off offset:20 ; 4-byte Folded Spill
; CHECK-NEXT:    global_load_b32 v2, v[0:1], off offset:96 scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    scratch_store_b32 off, v2, off offset:24 ; 4-byte Folded Spill
; CHECK-NEXT:    global_load_b32 v2, v[0:1], off offset:160 scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    scratch_store_b32 off, v2, off offset:28 ; 4-byte Folded Spill
; CHECK-NEXT:    global_load_b32 v0, v[0:1], off offset:240 scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    scratch_store_b32 off, v0, off offset:32 ; 4-byte Folded Spill
; CHECK-NEXT:    ;;#ASMSTART
; CHECK-NEXT:    ;;#ASMEND
; CHECK-NEXT:    s_wait_storecnt 0x0
; CHECK-NEXT:    global_store_b32 v[0:1], v10, off scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_storecnt 0x0
; CHECK-NEXT:    scratch_load_b32 v0, off, off offset:16 th:TH_LOAD_LU ; 4-byte Folded Reload
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    global_store_b32 v[0:1], v0, off scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_storecnt 0x0
; CHECK-NEXT:    scratch_load_b32 v0, off, off offset:20 th:TH_LOAD_LU ; 4-byte Folded Reload
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    global_store_b32 v[0:1], v0, off scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_storecnt 0x0
; CHECK-NEXT:    scratch_load_b32 v0, off, off offset:24 th:TH_LOAD_LU ; 4-byte Folded Reload
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    global_store_b32 v[0:1], v0, off scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_storecnt 0x0
; CHECK-NEXT:    scratch_load_b32 v0, off, off offset:28 th:TH_LOAD_LU ; 4-byte Folded Reload
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    global_store_b32 v[0:1], v0, off scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_storecnt 0x0
; CHECK-NEXT:    scratch_load_b32 v0, off, off offset:32 th:TH_LOAD_LU ; 4-byte Folded Reload
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    global_store_b32 v[0:1], v0, off scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_storecnt 0x0
; CHECK-NEXT:    scratch_load_b32 v0, off, off offset:8 th:TH_LOAD_LU ; 4-byte Folded Reload
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    global_store_b32 v[0:1], v0, off scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_storecnt 0x0
; CHECK-NEXT:    scratch_load_b32 v0, off, off offset:12 th:TH_LOAD_LU ; 4-byte Folded Reload
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    global_store_b32 v[0:1], v0, off scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_storecnt 0x0
; CHECK-NEXT:    ; implicit-def: $vgpr0
; CHECK-NEXT:    ; kill: killed $vgpr0
; CHECK-NEXT:    ; implicit-def: $vgpr0
; CHECK-NEXT:    ; kill: killed $vgpr0
; CHECK-NEXT:    ; implicit-def: $vgpr0_vgpr1
; CHECK-NEXT:  .LBB1_2: ; %Flow
; CHECK-NEXT:    s_and_not1_saveexec_b32 s0, s0
; CHECK-NEXT:    s_cbranch_execz .LBB1_4
; CHECK-NEXT:  ; %bb.3: ; %.true
; CHECK-NEXT:    global_load_b32 v10, v[0:1], off scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    global_load_b32 v2, v[0:1], off offset:16 scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    scratch_store_b32 off, v2, off offset:16 ; 4-byte Folded Spill
; CHECK-NEXT:    global_load_b32 v2, v[0:1], off offset:48 scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    scratch_store_b32 off, v2, off offset:20 ; 4-byte Folded Spill
; CHECK-NEXT:    global_load_b32 v2, v[0:1], off offset:96 scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    scratch_store_b32 off, v2, off offset:24 ; 4-byte Folded Spill
; CHECK-NEXT:    global_load_b32 v2, v[0:1], off offset:160 scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    scratch_store_b32 off, v2, off offset:28 ; 4-byte Folded Spill
; CHECK-NEXT:    global_load_b32 v0, v[0:1], off offset:240 scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    scratch_store_b32 off, v0, off offset:32 ; 4-byte Folded Spill
; CHECK-NEXT:    ;;#ASMSTART
; CHECK-NEXT:    ;;#ASMEND
; CHECK-NEXT:    s_wait_storecnt 0x0
; CHECK-NEXT:    global_store_b32 v[0:1], v10, off scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_storecnt 0x0
; CHECK-NEXT:    scratch_load_b32 v0, off, off offset:16 th:TH_LOAD_LU ; 4-byte Folded Reload
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    global_store_b32 v[0:1], v0, off scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_storecnt 0x0
; CHECK-NEXT:    scratch_load_b32 v0, off, off offset:20 th:TH_LOAD_LU ; 4-byte Folded Reload
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    global_store_b32 v[0:1], v0, off scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_storecnt 0x0
; CHECK-NEXT:    scratch_load_b32 v0, off, off offset:24 th:TH_LOAD_LU ; 4-byte Folded Reload
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    global_store_b32 v[0:1], v0, off scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_storecnt 0x0
; CHECK-NEXT:    scratch_load_b32 v0, off, off offset:28 th:TH_LOAD_LU ; 4-byte Folded Reload
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    global_store_b32 v[0:1], v0, off scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_storecnt 0x0
; CHECK-NEXT:    scratch_load_b32 v0, off, off offset:32 th:TH_LOAD_LU ; 4-byte Folded Reload
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    global_store_b32 v[0:1], v0, off scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_storecnt 0x0
; CHECK-NEXT:    scratch_load_b32 v0, off, off offset:8 th:TH_LOAD_LU ; 4-byte Folded Reload
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    global_store_b32 v[0:1], v0, off scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_storecnt 0x0
; CHECK-NEXT:    scratch_load_b32 v0, off, off offset:12 th:TH_LOAD_LU ; 4-byte Folded Reload
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    global_store_b32 v[0:1], v0, off scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_storecnt 0x0
; CHECK-NEXT:  .LBB1_4: ; %.exit
; CHECK-NEXT:    s_or_b32 exec_lo, exec_lo, s0
; CHECK-NEXT:    scratch_load_b32 v0, off, off th:TH_LOAD_LU ; 4-byte Folded Reload
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    s_wait_storecnt 0x0
; CHECK-NEXT:    global_store_b32 v[0:1], v0, off scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_storecnt 0x0
; CHECK-NEXT:    scratch_load_b32 v0, off, off offset:4 th:TH_LOAD_LU ; 4-byte Folded Reload
; CHECK-NEXT:    s_wait_loadcnt 0x0
; CHECK-NEXT:    global_store_b32 v[0:1], v0, off scope:SCOPE_SYS
; CHECK-NEXT:    s_wait_storecnt 0x0
; CHECK-NEXT:    s_endpgm
.entry:
  %tid = load volatile i32, ptr addrspace(1) poison
  %p1 = getelementptr inbounds i32, ptr addrspace(1) %p, i32 %tid
  %p2 = getelementptr inbounds i32, ptr addrspace(1) %p1, i32 4
  %p3 = getelementptr inbounds i32, ptr addrspace(1) %p2, i32 8
  %p4 = getelementptr inbounds i32, ptr addrspace(1) %p3, i32 12
  %p5 = getelementptr inbounds i32, ptr addrspace(1) %p4, i32 16
  %p6 = getelementptr inbounds i32, ptr addrspace(1) %p5, i32 20
  %p7 = getelementptr inbounds i32, ptr addrspace(1) %p6, i32 24
  %p8 = getelementptr inbounds i32, ptr addrspace(1) %p7, i32 28
  %p9 = getelementptr inbounds i32, ptr addrspace(1) %p8, i32 32
  %p10 = getelementptr inbounds i32, ptr addrspace(1) %p9, i32 36
  %v7 = load volatile i32, ptr addrspace(1) %p7
  %v8 = load volatile i32, ptr addrspace(1) %p8
  %v9 = load volatile i32, ptr addrspace(1) %p9
  %v10 = load volatile i32, ptr addrspace(1) %p10
  %cmp = icmp ne i32 %tmp, 0
  br i1 %cmp, label %.true, label %.false

.true:
  %v1_t = load volatile i32, ptr addrspace(1) %p1
  %v2_t = load volatile i32, ptr addrspace(1) %p2
  %v3_t = load volatile i32, ptr addrspace(1) %p3
  %v4_t = load volatile i32, ptr addrspace(1) %p4
  %v5_t = load volatile i32, ptr addrspace(1) %p5
  %v6_t = load volatile i32, ptr addrspace(1) %p6
  call void asm sideeffect "", "~{v[0:9]}" ()
  store volatile i32 %v1_t, ptr addrspace(1) poison
  store volatile i32 %v2_t, ptr addrspace(1) poison
  store volatile i32 %v3_t, ptr addrspace(1) poison
  store volatile i32 %v4_t, ptr addrspace(1) poison
  store volatile i32 %v5_t, ptr addrspace(1) poison
  store volatile i32 %v6_t, ptr addrspace(1) poison
  store volatile i32 %v7, ptr addrspace(1) poison
  store volatile i32 %v8, ptr addrspace(1) poison

  br label %.exit

.false:
  %v1_f = load volatile i32, ptr addrspace(1) %p1
  %v2_f = load volatile i32, ptr addrspace(1) %p2
  %v3_f = load volatile i32, ptr addrspace(1) %p3
  %v4_f = load volatile i32, ptr addrspace(1) %p4
  %v5_f = load volatile i32, ptr addrspace(1) %p5
  %v6_f = load volatile i32, ptr addrspace(1) %p6
  call void asm sideeffect "", "~{v[0:9]}" ()
  store volatile i32 %v1_f, ptr addrspace(1) poison
  store volatile i32 %v2_f, ptr addrspace(1) poison
  store volatile i32 %v3_f, ptr addrspace(1) poison
  store volatile i32 %v4_f, ptr addrspace(1) poison
  store volatile i32 %v5_f, ptr addrspace(1) poison
  store volatile i32 %v6_f, ptr addrspace(1) poison
  store volatile i32 %v7, ptr addrspace(1) poison
  store volatile i32 %v8, ptr addrspace(1) poison

  br label %.exit

.exit:
  store volatile i32 %v9, ptr addrspace(1) poison
  store volatile i32 %v10, ptr addrspace(1) poison
  ret void
}
