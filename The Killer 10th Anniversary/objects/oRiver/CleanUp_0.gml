// Need to free audio emitter when object is destoryed, to prevent memory leak.
// Note that audio emitters are not used in original AS3 source code.
audio_emitter_free(sndEmit);