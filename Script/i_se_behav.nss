#include "nw_i0_generic"

string SCEZ_Behaviour_GetIndependentQueue(string queueType) {
  if (queueType == "trans") {
    return "scez_tind";
  } else {
    return "scez_ind";
  }
}

void SCEZ_Behaviour_SetCollaborativeBehaviour(object actor, string beh) {
  SetLocalString(actor, "scez_cbeh", beh);
}

string SCEZ_Behaviour_GetCollaborativeBehaviour(object actor) {
  return GetLocalString(actor, "scez_cbeh");
}

int SCEZ_Behaviour_HasNewCollaborativeBehaviour(object actor) {
  return SCEZ_Behaviour_GetCollaborativeBehaviour(actor) != "";
}

void SCEZ_Behaviour_ResetCollaborativeBehaviour(object actor) {
  SCEZ_Behaviour_SetCollaborativeBehaviour(actor, "");
}

string SCEZ_Behaviour_GetCollaborativeQueue() {
  return "scez_col";  
}

object SCEZ_Behaviour_GetCollaborator(object actor) {
  return GetLocalObject(actor, "scez_collab");
}

void SCEZ_Behaviour_SetCollaborator(object actor, object collab) {
  SetLocalObject(actor, "scez_collab", collab);
}

void SCEZ_Behaviour_SetEyeContact(object actor) {
  SetLocalInt(actor, "scez_eye", 1);
}

void SCEZ_Behaviour_UnsetEyeContact(object actor) {
  SetLocalInt(actor, "scez_eye", 0);
}

int SCEZ_Behaviour_HasEyeContact(object actor) {
  return GetLocalInt(actor, "scez_eye");
}

void SCEZ_Behaviour_SetReady(object actor) {
  SetLocalInt(actor, "scez_ready", 1);
}

void SCEZ_Behaviour_UnsetReady(object actor) {
  SetLocalInt(actor, "scez_ready", 0);
}

int SCEZ_Behaviour_IsReady(object actor) {
  return GetLocalInt(actor, "scez_ready");
}

void SCEZ_Behaviour_SetExecuting(object actor) {
  SetLocalInt(actor, "scez_exec", 1);
}

void SCEZ_Behaviour_UnsetExecuting(object actor) {
  SetLocalInt(actor, "scez_exec", 0);
}

int SCEZ_Behaviour_IsExecuting(object actor) {
  return GetLocalInt(actor, "scez_exec");
}

void SCEZ_Behaviour_SetSync(object actor) {
  SetLocalInt(actor, "scez_sync", 1);
}

void SCEZ_Behaviour_UnsetSync(object actor) {
  SetLocalInt(actor, "scez_sync", 0);
}

int SCEZ_Behaviour_IsSync(object actor) {
  return GetLocalInt(actor, "scez_sync");
}

void SCEZ_Behaviour_SetInterrupted(object actor) {
  SetLocalInt(actor, "scez_intr", 1);
}

void SCEZ_Behaviour_UnsetInterrupted(object actor) {
  SetLocalInt(actor, "scez_intr", 0);
}

int SCEZ_Behaviour_IsInterrupted(object actor) {
  return GetLocalInt(actor, "scez_intr");
}

int SCEZ_Behaviour_IsDone(object actor) {
  return SCEZ_Behaviour_IsReady(actor) || SCEZ_Behaviour_IsInterrupted(actor);
}

int SCEZ_Behaviour_IncrementWait(object actor) {
  int wait = GetLocalInt(actor, "scez_wait");
  SetLocalInt(actor, "scez_wait", wait+1);
  return wait+1;
}

void SCEZ_Behaviour_ResetWait(object actor) {
  SetLocalInt(actor, "scez_wait", 0);
}

void SCEZ_Behaviour_SetSignal(object actor) {
  SetLocalInt(actor, "sczm__signal", 0);
}

void SCEZ_Behaviour_UnsetSignal(object actor) {
  SetLocalInt(actor, "sczm__signal", 1);
}

int SCEZ_Behaviour_IsSignaled(object actor) {
  return GetLocalInt(actor, "sczm__signal") == 0;
}

int SCEZ_Behaviour_IsDialogueEvent() {
  return GetUserDefinedEventNumber() == EVENT_DIALOGUE;
}

// behaviour include file
void SCEZ_Behaviour_SendSpin(object o) {
  DelayCommand(0.2f, AssignCommand(o, SignalEvent(o, EventUserDefined(31415))));
}

int SCEZ_Behaviour_IsSpinEvent() {
  return GetUserDefinedEventNumber() == 31415;
}

void SCEZ_Behaviour_Conversation() {
  ClearAllActions(TRUE);
  SCEZ_Behaviour_SetSignal(OBJECT_SELF);
}

int SCEZ_Behaviour_GetUID(object actor) {
  return GetLocalInt(actor, "sczm__uid");
}

void SCEZ_Behaviour_IncrementUID(object actor) {
  int uid = GetLocalInt(actor, "sczm__uid");
  SetLocalInt(actor, "sczm__uid", uid+1);
}

void SCEZ_Behaviour_Spawn() {
  SetSpawnInCondition(NW_FLAG_ON_DIALOGUE_EVENT);
  SetLocalFloat(OBJECT_SELF, "SE_AUX_ORIGINAL_FACING", GetFacing(OBJECT_SELF));
  SetLocalLocation(OBJECT_SELF, "SE_AUX_ORIGINAL_LOCATION", GetLocation(OBJECT_SELF));
  SignalEvent(OBJECT_SELF, EventUserDefined(31415));
}

int SCEZ_Behaviour_IncrementTimeout(object actor) {
  int to = GetLocalInt(actor, "sczm__timeout");
  SetLocalInt(actor, "sczm__timeout", to+1);
  return to;
}

void SCEZ_Behaviour_ResetTimeout(object actor) {
  SetLocalInt(actor, "sczm__timeout", 1);
}

int SCEZ_Behaviour_GetMotivation(object actor, string motivation) {
  return GetLocalInt(actor, "sczm_"+motivation);
}

void SCEZ_Behaviour_SetMotivation(object actor, string motivation, int val) {
  if (val < 0) {
    val = 0;
  }
  if (val > 100) {
    val = 100;
  }
  SetLocalInt(actor, "sczm_"+motivation, val);
}

void SCEZ_Behaviour_IncreaseMotivation(object actor, string motivation, int delta) {
  int val;
  val = SCEZ_Behaviour_GetMotivation(actor, motivation);
  val = val + delta;
  SCEZ_Behaviour_SetMotivation(actor, motivation, val);
}

void SCEZ_Behaviour_DecreaseMotivation(object actor, string motivation, int delta) {
  int val;
  val = SCEZ_Behaviour_GetMotivation(actor, motivation);
  val = val - delta;
  SCEZ_Behaviour_SetMotivation(actor, motivation, val);
}

string SCEZ_Behaviour_GetPhase(object actor) {
  return GetLocalString(actor, "sczm_phase");
}

void SCEZ_Behaviour_SetPhase(object actor, string phase) {
  SetLocalString(actor, "sczm_phase", phase);
}

void SCEZ_Behaviour_ResetPhase(object actor) {
  SetLocalString(actor, "sczm_phase", "");
}

string SCEZ_Behaviour_GetTransientPhase(object actor) {
  return GetLocalString(actor, "sczm_tphase");
}

void SCEZ_Behaviour_SetTransientPhase(object actor, string phase) {
  SetLocalString(actor, "sczm_tphase", phase);
}

void SCEZ_Behaviour_ResetTransientPhase(object actor) {
  SetLocalString(actor, "sczm_tphase", "");
}

int SCEZ_Behaviour_IsQueueEmpty(object actor, string queue) {
  return GetLocalInt(actor, queue+"h") == GetLocalInt(actor, queue+"t");
}

string SCEZ_Behaviour_Top(object actor, string queue) {
  int current = GetLocalInt(actor, queue+"h");
  return GetLocalString(actor, queue+IntToString(current));
}

void SCEZ_Behaviour_Next(object actor, string queue) {
  // dequeue current action
  int current = GetLocalInt(actor, queue+"h");
  DeleteLocalString(actor, queue+IntToString(current));
  current = current + 1;
  SetLocalInt(actor, queue+"h", current);    
}

void SCEZ_Behaviour_SignalUID(object actor, string queue, int uid) {
  if (SCEZ_Behaviour_GetUID(actor) == uid) {
    ClearAllActions(TRUE);

    // dequeue current action
    SCEZ_Behaviour_Next(actor, queue);
  
    // signal the spin
    SCEZ_Behaviour_SetSignal(actor);
  }
}

void SCEZ_Behaviour_Signal(object actor, string queue) {
  // dequeue current action
  SCEZ_Behaviour_Next(actor, queue);
  
  // signal the spin
  SCEZ_Behaviour_SetSignal(actor);
}

void SCEZ_Behaviour_ClearQueue(object actor, string queue) {
  while(!SCEZ_Behaviour_IsQueueEmpty(actor, queue)) {
    SCEZ_Behaviour_Next(actor, queue);
  }
}

void SCEZ_Behaviour_Queue(object actor, string queue, string reactive) {
  // queue reactive at tail
  int tail = GetLocalInt(actor, queue+"t");
  SetLocalString(actor, queue+IntToString(tail), reactive);
  tail = tail + 1;  
  SetLocalInt(actor, queue+"t", tail);
}

void SCEZ_Behaviour_KillCollaboration(object actor) {
  object collab = SCEZ_Behaviour_GetCollaborator(actor);
  if (GetIsObjectValid(collab)) {
    SCEZ_Behaviour_UnsetEyeContact(collab);
    SCEZ_Behaviour_ClearQueue(collab, SCEZ_Behaviour_GetCollaborativeQueue());
  }
  SCEZ_Behaviour_UnsetEyeContact(actor);
  SCEZ_Behaviour_ClearQueue(actor, SCEZ_Behaviour_GetCollaborativeQueue());
}

void SCEZ_Behaviour_CollaboratorArrayClear() {
  int n = GetLocalInt(OBJECT_SELF, "scez_can");
  int i = 0;
  while(i < n) {
    DeleteLocalObject(OBJECT_SELF, "scez_ca"+IntToString(i));
    i = i + 1;
  }
  DeleteLocalInt(OBJECT_SELF, "scez_can");
}

void SCEZ_Behaviour_CollaboratorArrayAdd(object c) {
  int n = GetLocalInt(OBJECT_SELF, "scez_can");
  SetLocalObject(OBJECT_SELF, "scez_ca"+IntToString(n), c);
  SetLocalInt(OBJECT_SELF, "scez_can", n+1);
}

object SCEZ_Behaviour_CollaboratorArrayRandom() {
  int n = GetLocalInt(OBJECT_SELF, "scez_can");
  if (n == 0) {
    return OBJECT_INVALID;
  } else {
    int i = Random(n);
    return GetLocalObject(OBJECT_SELF, "scez_ca"+IntToString(i));
  }
}

void SCEZ_Behaviour_CollaborativeReactiveStart() {
  SCEZ_Behaviour_UnsetReady(OBJECT_SELF);
  SCEZ_Behaviour_UnsetInterrupted(OBJECT_SELF);
  SCEZ_Behaviour_ResetWait(OBJECT_SELF);
}

void SCEZ_Behaviour_SignalCollaborativeUID(object actor, string queue, int uid) {
  if (SCEZ_Behaviour_GetUID(actor) == uid) {
    ClearAllActions(TRUE);

    // set the ready flag
    SCEZ_Behaviour_SetReady(actor);
    SCEZ_Behaviour_UnsetExecuting(actor);
   
    // signal the spin
    SCEZ_Behaviour_SetSignal(actor);
  }
}

void SCEZ_Behaviour_SignalCollaborative(object actor, string queue) {
  // set the ready flag
  SCEZ_Behaviour_SetReady(actor);  
  SCEZ_Behaviour_UnsetExecuting(actor);
  
  // signal the spin
  SCEZ_Behaviour_SetSignal(actor);
}