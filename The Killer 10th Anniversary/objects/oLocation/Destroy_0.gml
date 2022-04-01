// Free up the emitters to prevent a memory leak.
if (audio_emitter_exists(sEmit0)) { 
	//show_debug_message("sEmit0 exists: free it up now");
	audio_emitter_free(sEmit0);
}
if (audio_emitter_exists(sEmit1)) audio_emitter_free(sEmit1);
if (audio_emitter_exists(sEmit2)) audio_emitter_free(sEmit2);
if (audio_emitter_exists(sEmit3)) audio_emitter_free(sEmit3);
if (audio_emitter_exists(sEmit4)) audio_emitter_free(sEmit4);