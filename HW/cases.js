const factorial = n =>{
    let x = 1;
    for(let i = 1; i<=n; i++){
        x *= i;
    }
    return x;
}

const permutation = (n,r) => factorial(n)/factorial(n-r);
const combination = (n,r) => factorial(n)/(factorial(n-r) * factorial(r));
const multiPermutation = (n,r) => n ** r;
const multiCombination = (n,r) => combination(n+1-r,r);

module.exports = {
    permutation,
    combination,
    multiPermutation,
    multiCombination,
};