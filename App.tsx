/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */

import React from 'react';
import {
  SafeAreaView,
  Text,
  View,
  TouchableOpacity,
  StyleSheet,
} from 'react-native';

import {Colors} from 'react-native/Libraries/NewAppScreen';

function App(): JSX.Element {
  const onShare = () => {
   //implement native module
  };

  return (
    <SafeAreaView style={styles.safeArea}>
      <View style={styles.container}>
        <TouchableOpacity onPress={onShare} style={styles.btnShare}>
          <Text style={styles.text}>{'Share'}</Text>
        </TouchableOpacity>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safeArea: {
    flex: 1,
  },
  container: {
    backgroundColor: Colors.white,
    justifyContent: 'center',
    alignItems: 'center',
    flex: 1,
  },
  btnShare: {
    backgroundColor: '#007AFF',
    width: 120, 
    borderRadius: 5,
    padding: 10,
    alignItems: 'center',
    justifyContent: 'center'
  },
  text: {
    color: Colors.white,
  },
});
export default App;
