/*  All this "specific" stuff is now on hold.  Kept for possible future use
// Gets the nearest object from resref list, including self
object SE_AUX_GetNearestSpecificObjectWithSelf(string tag, string resref){
  int i = 0;
  object obj;
  while (GetResRef(obj) != resref){
    obj = GetNearestObjectByTag(tag, caller, i++);
    if (obj == OBJECT_INVALID) return OBJECT_INVALID;
  }
  return obj;
}

// Gets a random object of the resref list, including self
object SE_AUX_GetRandomSpecificObjectWithSelf(string tag, string resref){
  int count = 0;
  int i = 0;
  int randomNumber = 0;
  object obj = GetObjectByTag(tag, i++);
  while (obj != OBJECT_INVALID) {
    if (GetResRef(obj) == resref)
      count++;
    obj = GetObjectByTag(tag, i++);
  }
  if (count == 0)
    return OBJECT_INVALID;
  randomNumber = Random(count);
  i = 0;
  count = 0;
  obj = GetObjectByTag(tag, i++);
  while (obj != OBJECT_INVALID) {
    if (GetResRef(obj) == resref) {
      if(count == randomNumber)
        break;
      count++;
    }
    obj = GetObjectByTag(tag, i++);
  }
  return obj;
}

// Gets the nearest object of the resref, excluding self
object SE_AUX_GetFirstSpecificObjectWithoutSelf(string tag, string resref){
  int i = 0;
  object obj;
  while (GetResRef(obj) != resref || obj == OBJECT_SELF){
    obj = GetObjectByTag(tag, i++);
    if (obj == OBJECT_INVALID) return OBJECT_INVALID;
  }
  return obj;
}

// Gets a random object of the resref list, excluding self
object SE_AUX_GetRandomSpecificObjectWithoutSelf(string tag, string resref){
  int count = 0;
  int i = 0;
  int randomNumber = 0;
  object obj = GetObjectByTag(tag, i++);
  while (obj != OBJECT_INVALID) {
    if (GetResRef(obj) == resref && obj != OBJECT_SELF)
      count++;
    obj = GetObjectByTag(tag, i++);
  }
  if (count == 0)
  	return OBJECT_INVALID;
  randomNumber = Random(count);
  i = 0;
  count = 0;
  obj = GetObjectByTag(tag, i++);
  while (obj != OBJECT_INVALID) {
    if (GetResRef(obj) == resref && obj != OBJECT_SELF){
      if (count == randomNumber)
        break;
      count++;
    }
    obj = GetObjectByTag(tag, i++);
  }
  return obj;
}
*/

// Gets the nearest object from tag list, excluding self
object SE_AUX_GetNearestObjectWithoutSelf(string tag) {
  object obj = GetNearestObjectByTag(tag);
  if (obj == OBJECT_SELF)
    obj = GetNearestObjectByTag(tag, OBJECT_SELF, 1);
  return obj;
}

// Gets a random object from tag list, including self
object SE_AUX_GetRandomObjectWithSelf(string tag) {
  int count = 0;
  int i = 0;
  int randomNumber = 0;
  object obj = GetObjectByTag(tag, i++);
  while (obj != OBJECT_INVALID) {
    count++;
    obj = GetObjectByTag(tag, i++);
  }
  if (count == 0)
    return OBJECT_INVALID;
  randomNumber = Random(count);
  i = 0;
  count = 0;
  obj = GetObjectByTag(tag, i++);
  while (obj != OBJECT_INVALID) {
    if (count == randomNumber)
      break;
    count++;
    obj = GetObjectByTag(tag, i++);
  }
  return obj;
}

// Gets a random object from tag list, excluding self
object SE_AUX_GetRandomObjectWithoutSelf(string tag) {
  int count = 0;
  int i = 0;
  int randomNumber = 0;
  int selfRef = -1;
  object obj = GetObjectByTag(tag, i++);
  while (obj != OBJECT_INVALID) {
  	if (obj == OBJECT_SELF)
  	  selfRef = i;
  	count++;
  	obj = GetObjectByTag(tag, i++);
  }
  if (count == 0)
    return OBJECT_INVALID;
  randomNumber = Random(count);
  while (randomNumber == selfRef) //Make sure we don't pick self
    randomNumber = Random(count);
  i = 0;
  count = 0;
  obj = GetObjectByTag(tag, i++);
  while (obj != OBJECT_INVALID) {
    if (count == randomNumber)
      break;
    count++;
    obj = GetObjectByTag(tag, i++);
  }
  return obj;
}



// Derivative of CreateItemOnObject that can be placed on an action queue.
void SE_AUX_CreateItemOnObject(string blueprint, object target)
{
  CreateItemOnObject(blueprint, target);
}

// Function that determines if a one-time situation should run.
int SE_AUX_Once(string var, int nEntities, int shouldDelete)
{
  string instvar = var + "_ninst";
  int nInstances = GetLocalInt(GetModule(), instvar );
  int bFound = FALSE;
   /* linear search expecting this not to happen too often for any
    * one var.
    */
  int i,j;
  for( i = 0; i < nInstances; ++i ) {
    int b_iMatches = TRUE;
    for( j = 0; j < nEntities; ++j ) {
      string vij = var + "_" + IntToString(i) + "_" + IntToString(j);
      string vej = var + "_" + IntToString(j);

      if( GetLocalObject(GetModule(), vij) !=
          GetLocalObject(OBJECT_SELF, vej) ) {
        b_iMatches = FALSE;
        break;
      }
    } // for j
    if( b_iMatches == TRUE ) {
      bFound = TRUE;
      break;
    }
  } // for i

  if( bFound != TRUE ) {
    // record this set of entities.
    for( j = 0; j < nEntities; ++j ) {
      string vij = var + "_" + IntToString(nInstances) + "_" + IntToString(j);
      string vej = var + "_" + IntToString(j);

      SetLocalObject( GetModule(), vij, GetLocalObject(OBJECT_SELF, vej) );
    }
    // Increment count of previous occurrence set.
    SetLocalInt( GetModule(), instvar, nInstances + 1 );
  }
  /* regardless of whether this set of entities already existed, delete
   * the input array.
   */
  if( shouldDelete ) {
    for( j = 0; j < nEntities; ++j ) {
      string vej = var + "_" + IntToString(j);
      DeleteLocalObject( OBJECT_SELF, vej );
    }
  }

  // May proceed if no previous sets were found.
  return ! bFound;
}

// Derivative of CreateObject that can be placed on an action queue.
void SE_AUX_CreateObject(int objectType, string blueprint, location loc)
{
  CreateObject(objectType, blueprint, loc);
}

/***SUPERHEARTBEAT STUFF***/
/*
    This is an interface for user defined heartbeat events. This allows
    the user to define a heartbeat event with a much shorter duration than
    the standard six second heartbeat event.

    (THE FOLLOWING RANGE COMPONENT HAS BEEN REMOVED FOR THE TIME BEING)

    The heartbeat event also has a range component to it as well, so if the
    object with a heartbeat is not within range of a source then the heartbeat
    will not fire. This allows for a heartbeat event that is not CPU extensive
    if placed on a large amount of objects.
*/

/*
    Sets the super heartbeat event. When a super heartbeat occurs a userdefined
    event is fired on the target object.

    Multiple targets can be assigned to one activator and vice versa.

    target - This is the object that the super heartbeat is attached to. When
    a super heartbeat occurs a user defined event will be fired on the target
    object, with a specific event number.

    activator - This is the object that the target object must be within range
    of in order to have a super heartbeat occur. The range is 15.0 metres.
*/
void SE_AUX_SetSuperHeartBeat(object target, object activator);

/*
    Removes the super heart beat between the target and the activator.
*/
void SE_AUX_RemoveSuperHeartBeat(object target, object activator);

/*
    This function is called internally by SetSuperHeartBeat, there is no need
    for a user to call this function.
*/
void SE_AUX_PerformSuperHeartBeat(object activator);

/*
    Returns TRUE if the target object has just fired a super heartbeat given
    the user defined event number.

    Returns FALSE otherwise.
*/
int SE_AUX_IsSuperHeartBeat(object target, int event_num);

void SE_AUX_SetSuperHeartBeat(object target, object activator)
{
    // See if there is a super heartbeat already.
    int activator_id = GetLocalInt(activator, "SE_AUX_SHB_ACTIVATOR_ID");
    int num_targets = GetLocalInt(activator, "SE_AUX_SHB_NUM_TARGETS");

    // If this activator has no ID assigned to them...
    if(activator_id == 0)
    {
        // Assign a new ID.

        activator_id = 1 + GetLocalInt(GetModule(), "SE_AUX_SHB_LAST_KNOWN_ACTIVATOR_ID");
        SetLocalInt(GetModule(), "SE_AUX_SHB_LAST_KNOWN_ACTIVATOR_ID", activator_id);
        SetLocalInt(activator, "SE_AUX_SHB_ACTIVATOR_ID", activator_id);
    }

    string id_string = "SE_AUX_SHB_ACTIVATOR_ID_" + IntToString(activator_id);

    // If the activator hasn't registered the target then do so.
    if(GetLocalInt(target, id_string) == FALSE)
    {
        SetLocalInt(target, id_string, TRUE);
        SetLocalInt(activator, "SE_AUX_SHB_NUM_TARGETS", num_targets + 1);
    }

    // If the activator has just added its first target then we need to start
    // performing the super heart beat.
    if(num_targets == 0)
    {
        // This doesn't actually get called until we exit the current function.
        DelayCommand(0.0, SE_AUX_PerformSuperHeartBeat(activator));
    }
}

void SE_AUX_RemoveSuperHeartBeat(object target, object activator)
{
    int activator_id = GetLocalInt(activator, "SE_AUX_SHB_ACTIVATOR_ID");
    string id_string = "SE_AUX_SHB_ACTIVATOR_ID_" + IntToString(activator_id);

    int num_targets;

    // If the activator is registered with the target...
    if(GetLocalInt(target, id_string) == TRUE)
    {
        // Unregister the activator with the target.
        DeleteLocalInt(target, id_string);

        num_targets = GetLocalInt(activator, "SE_AUX_SHB_NUM_TARGETS");
        SetLocalInt(activator, "SE_AUX_SHB_NUM_TARGETS", num_targets - 1);
    }
}

void SE_AUX_PerformSuperHeartBeat(object activator)
{
    location activator_loc = GetLocation(activator);

    int obj_index = 0;
    object next_closest; // = GetNearestObject(OBJECT_TYPE_ALL, activator, obj_index);
    //float obj_distance = GetDistanceBetweenLocations(activator_loc, GetLocation(next_closest));

    int activator_id = GetLocalInt(activator, "SE_AUX_SHB_ACTIVATOR_ID");
    string id_string = "SE_AUX_SHB_ACTIVATOR_ID_" + IntToString(activator_id);

    string producer_string;
    object current_object;
    int producer_index;
    int buffer_size;

    // If the activator has 0 targets then we can stop performing the
    // super heart beat
    if(GetLocalInt(activator, "SE_AUX_SHB_NUM_TARGETS") == 0)
    {
        return;
    }

    // First check to see if the area the activator is in is registered for a
    // super heart beat with the area
    next_closest = GetArea(activator);

    // Loop through all objects within 15.0 metres of the activator
    while(GetIsObjectValid(next_closest)) // && obj_distance < 15.0)
    {
        // If the object has a super heart beat registered with the activator...
        if(GetLocalInt(next_closest, id_string) == TRUE)
        {
            // The activator has a bounded buffer of the activators that have
            // activated the super heart beat, add this activator to it.

            buffer_size = 50; // This is the buffer size.

            // The producer_index should be at the next unallocated space in
            // the buffer.
            producer_index = GetLocalInt(next_closest, "SE_AUX_SHB_PRODUCER_INDEX");

            producer_string = "SE_AUX_SHB_ACTIVATOR_" + IntToString(producer_index);
            current_object = GetLocalObject(next_closest, producer_string);

            // We can only add to the buffer if the current_object is invalid
            // otherwise the buffer is full.
            if(!GetIsObjectValid(current_object))
            {
                // Add the activator to the buffer.
                SetLocalObject(next_closest, producer_string, activator);

                // Increment the producer index
                producer_index ++;

                // Wrap around the buffer if needed.
                if(producer_index == buffer_size)
                {
                    producer_index = 0;
                }

                // Set the producer index.
                SetLocalInt(next_closest, "SE_AUX_SHB_PRODUCER_INDEX", producer_index);
            }

            // Finally signal the event.
            SignalEvent(next_closest, EventUserDefined(42));
        }

        obj_index ++;
        next_closest = GetNearestObject(OBJECT_TYPE_ALL, activator, obj_index);
        //obj_distance = GetDistanceBetweenLocations(activator_loc, GetLocation(next_closest));
    }

    DelayCommand(0.333333333, SE_AUX_PerformSuperHeartBeat(activator));
}

int SE_AUX_IsSuperHeartBeat(object target, int event_num)
{
    int producer_index;
    int consumer_index;

    object activator;

    string activator_string;

    int buffer_size = 50;

    // If the event number is not that of the super heart beat...
    if(event_num != 42)
    {
        return FALSE;
    }

    // Get the consumer index.
    consumer_index = GetLocalInt(target, "SE_AUX_SHB_CONSUMER_INDEX");
    // Get the producer index.
    producer_index = GetLocalInt(target, "SE_AUX_SHB_PRODUCER_INDEX");

    // If there are no objects currently in the buffer...
    if(consumer_index == producer_index)
    {
        // Just return FALSE
        return FALSE;
    }

    activator_string = "SE_AUX_SHB_ACTIVATOR_" + IntToString(consumer_index);

    // Get the next consumer.
    activator = GetLocalObject(target, activator_string);
    DeleteLocalObject(target, activator_string);

    // Increment to the next consumer index
    consumer_index ++;
    // Account for wrap around
    if(consumer_index == buffer_size)
    {
        consumer_index = 0;
    }
    // Set the new consumer index
    SetLocalInt(target, "SE_AUX_SHB_CONSUMER_INDEX", consumer_index);

    int return_status = FALSE;

    if(GetIsObjectValid(activator))
    {
        // Sets the current activator. (This applies to the script that this function
        // is called from.
        SetLocalObject(target, "SE_AUX_SHB_ACTIVATOR", activator);

        return_status = TRUE;
    }

    return return_status;
}

/**
 * Return 1 with probability numerator / denominator.
 * Results undefined if denominator <= 0.
 */
int SE_AUX_RandomGroupChance( int numerator, int denominator ) {
  return (Random(denominator) < numerator);
}

/**
 * Use with ActionDoCommand to queue up a Special Conversation. This has to
 * exist so that the local variable set on the owner isn't overwritten by
 * multiple queued one-liner actions.
 * @param topickey The string key to set on the owner that must be matched
 * against the argument in the <matchvar> tag in the Comment field of the header
 * node in the topic group in the dialog file.
 */
void SE_AUX_SpeakSpecialOneLiner( object speaker, string topickey,
                                  string topic, string dlgfile ) {
  SetLocalString(OBJECT_SELF, topickey, topic);
  AssignCommand(speaker, SpeakOneLinerConversation(dlgfile));
}



/**
 * Get the nearest creature
 */

object SE_AUX_GetNearestCreature() {

  object creature = GetNearestCreature(
                      CREATURE_TYPE_PLAYER_CHAR,
                      PLAYER_CHAR_NOT_PC);
  
  return creature;
  
}

/**
 * Get a random creature
 */
 
object SE_AUX_GetRandomCreature() {

  int i = 1;
  object creature = GetNearestCreature(
                      CREATURE_TYPE_PLAYER_CHAR,
                      PLAYER_CHAR_NOT_PC);

  while(creature != OBJECT_INVALID) {
    i++;
    creature = GetNearestCreature(
                 CREATURE_TYPE_PLAYER_CHAR,
                 PLAYER_CHAR_NOT_PC,
                 OBJECT_SELF,
                 i);    
  }
  
  int rand = Random(i-1) + 1;
  
  creature = GetNearestCreature(
               CREATURE_TYPE_PLAYER_CHAR,
               PLAYER_CHAR_NOT_PC,
               OBJECT_SELF,
               rand);

  return creature;

}

/**
 * Get the nearest PC
 */

object SE_AUX_GetNearestPC() {

  object creature = GetNearestCreature(
                      CREATURE_TYPE_PLAYER_CHAR,
                      PLAYER_CHAR_IS_PC);
  
  return creature;
  
}

/**
 * Get a random PC
 */
 
object SE_AUX_GetRandomPC() {

  int i = 1;
  object creature = GetNearestCreature(
                      CREATURE_TYPE_PLAYER_CHAR,
                      PLAYER_CHAR_IS_PC);

  while(creature != OBJECT_INVALID) {
    i++;
    creature = GetNearestCreature(
                 CREATURE_TYPE_PLAYER_CHAR,
                 PLAYER_CHAR_IS_PC,
                 OBJECT_SELF,
                 i);    
  }
  
  int rand = Random(i-1) + 1;
  
  creature = GetNearestCreature(
               CREATURE_TYPE_PLAYER_CHAR,
               PLAYER_CHAR_IS_PC,
               OBJECT_SELF,
               rand);
               
  return creature;

}